defmodule ExOpenAI.FineTuning do
  @moduledoc """
  Functions for the OpenAI fine_tuning API.
  """
  (
    @doc """
    Run a grader.


    ## Parameters

    * `grader` - **required** - `ExOpenAI.Components.GraderStringCheck.input() | ExOpenAI.Components.GraderTextSimilarity.input() | ExOpenAI.Components.GraderPython.input() | ExOpenAI.Components.GraderScoreModel.input() | ExOpenAI.Components.GraderMulti.input()`
      The grader used for the fine-tuning job.

    * `model_sample` - **required** - `String.t()`
      The model sample to be evaluated. This value will be used to populate
    the `sample` namespace. See [the guide](https://platform.openai.com/docs/guides/graders) for more details.
    The `output_json` variable will be populated if the model sample is a
    valid JSON string.

    ## Options

    * `item` - **optional** - `map()`
      The dataset item provided to the grader. This will be used to populate
    the `item` namespace. See [the guide](https://platform.openai.com/docs/guides/graders) for more details.
    """
    (
      @type run_grader_opt() :: {:item, map()} | ExOpenAI.request_option()
      @spec run_grader(
              grader ::
                (((ExOpenAI.Components.GraderStringCheck.input()
                   | ExOpenAI.Components.GraderTextSimilarity.input())
                  | ExOpenAI.Components.GraderPython.input())
                 | ExOpenAI.Components.GraderScoreModel.input())
                | ExOpenAI.Components.GraderMulti.input(),
              model_sample :: String.t(),
              opts :: [run_grader_opt()]
            ) :: {:ok, ExOpenAI.Components.RunGraderResponse.t()} | {:error, any()}
    )

    def run_grader(grader, model_sample, opts \\ []) do
      url = "/fine_tuning/alpha/graders/run"
      query_params = Keyword.take(opts, [])
      url = ExOpenAI.Query.append(url, query_params)
      body_params = [grader: grader, model_sample: model_sample]
      optional_body_params = Keyword.take(opts, [:item])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [:item] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/RunGraderResponse"}
        )
      end

      nil

      ExOpenAI.Config.http_client().api_call(
        :post,
        url,
        body_params,
        :"application/json",
        opts,
        convert_response
      )
    end
  )

  (
    @doc """
    Validate a grader.


    ## Parameters

    * `grader` - **required** - `ExOpenAI.Components.GraderStringCheck.input() | ExOpenAI.Components.GraderTextSimilarity.input() | ExOpenAI.Components.GraderPython.input() | ExOpenAI.Components.GraderScoreModel.input() | ExOpenAI.Components.GraderMulti.input()`
      The grader used for the fine-tuning job.
    """
    (
      @type validate_grader_opt() :: ExOpenAI.request_option()
      @spec validate_grader(
              grader ::
                (((ExOpenAI.Components.GraderStringCheck.input()
                   | ExOpenAI.Components.GraderTextSimilarity.input())
                  | ExOpenAI.Components.GraderPython.input())
                 | ExOpenAI.Components.GraderScoreModel.input())
                | ExOpenAI.Components.GraderMulti.input(),
              opts :: [validate_grader_opt()]
            ) :: {:ok, ExOpenAI.Components.ValidateGraderResponse.t()} | {:error, any()}
    )

    def validate_grader(grader, opts \\ []) do
      url = "/fine_tuning/alpha/graders/validate"
      query_params = Keyword.take(opts, [])
      url = ExOpenAI.Query.append(url, query_params)
      body_params = [grader: grader]
      optional_body_params = Keyword.take(opts, [])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/ValidateGraderResponse"}
        )
      end

      nil

      ExOpenAI.Config.http_client().api_call(
        :post,
        url,
        body_params,
        :"application/json",
        opts,
        convert_response
      )
    end
  )

  (
    @doc """
    **NOTE:** This endpoint requires an [admin API key](https://platform.openai.com/docs/api-reference/admin-api-keys).

    Organization owners can use this endpoint to view all permissions for a fine-tuned model checkpoint.


    ## Parameters

    * `:fine_tuned_model_checkpoint` - **required** - `String.t()`
      The ID of the fine-tuned model checkpoint to get permissions for.

    ## Options

    * `:project_id` - **optional** - `String.t()`
      The ID of the project to get permissions for.

    * `:after` - **optional** - `String.t()`
      Identifier for the last permission ID from the previous pagination request.

    * `:limit` - **optional** - `integer()`
      Number of permissions to retrieve.
      Default: `10`

    * `:order` - **optional** - `:ascending | :descending | String.t()`
      The order in which to retrieve permissions.
      Allowed values: `"ascending"`, `"descending"`
      Default: `"descending"`
    """
    (
      @type list_fine_tuning_checkpoint_permissions_opt() ::
              ((({:project_id, String.t()} | {:after, String.t()}) | {:limit, integer()})
               | {:order, (:ascending | :descending) | String.t()})
              | ExOpenAI.request_option()
      @spec list_fine_tuning_checkpoint_permissions(
              fine_tuned_model_checkpoint :: String.t(),
              opts :: [list_fine_tuning_checkpoint_permissions_opt()]
            ) ::
              {:ok, ExOpenAI.Components.ListFineTuningCheckpointPermissionResponse.t()}
              | {:error, any()}
    )

    def list_fine_tuning_checkpoint_permissions(fine_tuned_model_checkpoint, opts \\ []) do
      url = "/fine_tuning/checkpoints/{fine_tuned_model_checkpoint}/permissions"

      url =
        String.replace(
          url,
          "{fine_tuned_model_checkpoint}",
          to_string(fine_tuned_model_checkpoint)
        )

      query_params = Keyword.take(opts, [:project_id, :after, :limit, :order])
      url = ExOpenAI.Query.append(url, query_params)
      body_params = []
      optional_body_params = Keyword.take(opts, [])
      body_params = body_params ++ optional_body_params

      optional_params_to_drop =
        [:after, :limit, :order, :project_id] |> Enum.reject(&(&1 == :stream))

      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{
            ref: "#/components/schemas/ListFineTuningCheckpointPermissionResponse"
          }
        )
      end

      nil

      ExOpenAI.Config.http_client().api_call(
        :get,
        url,
        body_params,
        :"application/json",
        opts,
        convert_response
      )
    end
  )

  (
    @doc """
    **NOTE:** Calling this endpoint requires an [admin API key](https://platform.openai.com/docs/api-reference/admin-api-keys).

    This enables organization owners to share fine-tuned models with other projects in their organization.


    ## Parameters

    * `:fine_tuned_model_checkpoint` - **required** - `String.t()`
      The ID of the fine-tuned model checkpoint to create a permission for.

    * `project_ids` - **required** - `list(String.t())`
      The project identifiers to grant access to.
    """
    (
      @type create_fine_tuning_checkpoint_permission_opt() :: ExOpenAI.request_option()
      @spec create_fine_tuning_checkpoint_permission(
              fine_tuned_model_checkpoint :: String.t(),
              project_ids :: list(String.t()),
              opts :: [create_fine_tuning_checkpoint_permission_opt()]
            ) ::
              {:ok, ExOpenAI.Components.ListFineTuningCheckpointPermissionResponse.t()}
              | {:error, any()}
    )

    def create_fine_tuning_checkpoint_permission(
          fine_tuned_model_checkpoint,
          project_ids,
          opts \\ []
        ) do
      url = "/fine_tuning/checkpoints/{fine_tuned_model_checkpoint}/permissions"

      url =
        String.replace(
          url,
          "{fine_tuned_model_checkpoint}",
          to_string(fine_tuned_model_checkpoint)
        )

      query_params = Keyword.take(opts, [])
      url = ExOpenAI.Query.append(url, query_params)
      body_params = [project_ids: project_ids]
      optional_body_params = Keyword.take(opts, [])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{
            ref: "#/components/schemas/ListFineTuningCheckpointPermissionResponse"
          }
        )
      end

      nil

      ExOpenAI.Config.http_client().api_call(
        :post,
        url,
        body_params,
        :"application/json",
        opts,
        convert_response
      )
    end
  )

  (
    @doc """
    **NOTE:** This endpoint requires an [admin API key](https://platform.openai.com/docs/api-reference/admin-api-keys).

    Organization owners can use this endpoint to delete a permission for a fine-tuned model checkpoint.


    ## Parameters

    * `:fine_tuned_model_checkpoint` - **required** - `String.t()`
      The ID of the fine-tuned model checkpoint to delete a permission for.

    * `:permission_id` - **required** - `String.t()`
      The ID of the fine-tuned model checkpoint permission to delete.
    """
    (
      @type delete_fine_tuning_checkpoint_permission_opt() :: ExOpenAI.request_option()
      @spec delete_fine_tuning_checkpoint_permission(
              fine_tuned_model_checkpoint :: String.t(),
              permission_id :: String.t(),
              opts :: [delete_fine_tuning_checkpoint_permission_opt()]
            ) ::
              {:ok, ExOpenAI.Components.DeleteFineTuningCheckpointPermissionResponse.t()}
              | {:error, any()}
    )

    def delete_fine_tuning_checkpoint_permission(
          fine_tuned_model_checkpoint,
          permission_id,
          opts \\ []
        ) do
      url = "/fine_tuning/checkpoints/{fine_tuned_model_checkpoint}/permissions/{permission_id}"

      url =
        String.replace(
          url,
          "{fine_tuned_model_checkpoint}",
          to_string(fine_tuned_model_checkpoint)
        )

      url = String.replace(url, "{permission_id}", to_string(permission_id))
      query_params = Keyword.take(opts, [])
      url = ExOpenAI.Query.append(url, query_params)
      body_params = []
      optional_body_params = Keyword.take(opts, [])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{
            ref: "#/components/schemas/DeleteFineTuningCheckpointPermissionResponse"
          }
        )
      end

      nil

      ExOpenAI.Config.http_client().api_call(
        :delete,
        url,
        body_params,
        :"application/json",
        opts,
        convert_response
      )
    end
  )

  (
    @doc """
    List your organization's fine-tuning jobs


    ## Options

    * `:after` - **optional** - `String.t()`
      Identifier for the last job from the previous pagination request.

    * `:limit` - **optional** - `integer()`
      Number of fine-tuning jobs to retrieve.
      Default: `20`

    * `:metadata` - **optional** - `map() | nil`
      Optional metadata filter. To filter, use the syntax `metadata[k]=v`. Alternatively, set `metadata=null` to indicate no metadata.
    """
    (
      @type list_paginated_fine_tuning_jobs_opt() ::
              (({:after, String.t()} | {:limit, integer()}) | {:metadata, map() | nil})
              | ExOpenAI.request_option()
      @spec list_paginated_fine_tuning_jobs(opts :: [list_paginated_fine_tuning_jobs_opt()]) ::
              {:ok, ExOpenAI.Components.ListPaginatedFineTuningJobsResponse.t()} | {:error, any()}
    )

    def list_paginated_fine_tuning_jobs(opts \\ []) do
      url = "/fine_tuning/jobs"
      query_params = Keyword.take(opts, [:after, :limit, :metadata])
      url = ExOpenAI.Query.append(url, query_params)
      body_params = []
      optional_body_params = Keyword.take(opts, [])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [:after, :limit, :metadata] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{
            ref: "#/components/schemas/ListPaginatedFineTuningJobsResponse"
          }
        )
      end

      nil

      ExOpenAI.Config.http_client().api_call(
        :get,
        url,
        body_params,
        :"application/json",
        opts,
        convert_response
      )
    end
  )

  (
    @doc """
    Creates a fine-tuning job which begins the process of creating a new model from a given dataset.

    Response includes details of the enqueued job including job status and the name of the fine-tuned models once complete.

    [Learn more about fine-tuning](https://platform.openai.com/docs/guides/model-optimization)


    ## Parameters

    * `model` - **required** - `String.t() | :"babbage-002" | :"davinci-002" | :"gpt-3.5-turbo" | :"gpt-4o-mini" | String.t()`
      The name of the model to fine-tune. You can select one of the
    [supported models](https://platform.openai.com/docs/guides/fine-tuning#which-models-can-be-fine-tuned).
      Example: `"gpt-4o-mini"`

    * `training_file` - **required** - `String.t()`
      The ID of an uploaded file that contains training data.

    See [upload file](https://platform.openai.com/docs/api-reference/files/create) for how to upload a file.

    Your dataset must be formatted as a JSONL file. Additionally, you must upload your file with the purpose `fine-tune`.

    The contents of the file should differ depending on if the model uses the [chat](https://platform.openai.com/docs/api-reference/fine-tuning/chat-input), [completions](https://platform.openai.com/docs/api-reference/fine-tuning/completions-input) format, or if the fine-tuning method uses the [preference](https://platform.openai.com/docs/api-reference/fine-tuning/preference-input) format.

    See the [fine-tuning guide](https://platform.openai.com/docs/guides/model-optimization) for more details.
      Example: `"file-abc123"`

    ## Options

    * `hyperparameters` - **optional** - `%{ optional(:batch_size) => :auto | String.t() | integer(), optional(:learning_rate_multiplier) => :auto | String.t() | number(), optional(:n_epochs) => :auto | String.t() | integer() }`
      The hyperparameters used for the fine-tuning job.
    This value is now deprecated in favor of `method`, and should be passed in under the `method` parameter.

    * `integrations` - **optional** - `list(%{ required(:type) => :wandb | String.t(), required(:wandb) => %{ optional(:entity) => String.t() | nil, optional(:name) => String.t() | nil, required(:project) => String.t(), optional(:tags) => list(String.t()) } }) | nil`
      A list of integrations to enable for your fine-tuning job.

    * `metadata` - **optional** - `ExOpenAI.Components.Metadata.input()`

    * `method` - **optional** - `ExOpenAI.Components.FineTuneMethod.input()`

    * `seed` - **optional** - `integer() | nil`
      The seed controls the reproducibility of the job. Passing in the same seed and job parameters should produce the same results, but may differ in rare cases.
    If a seed is not specified, one will be generated for you.
      Constraints: minimum: 0, maximum: 2147483647
      Example: `42`

    * `suffix` - **optional** - `String.t() | nil`
      A string of up to 64 characters that will be added to your fine-tuned model name.

    For example, a `suffix` of "custom-model-name" would produce a model name like `ft:gpt-4o-mini:openai:custom-model-name:7p4lURel`.
      Constraints: minLength: 1, maxLength: 64

    * `validation_file` - **optional** - `String.t() | nil`
      The ID of an uploaded file that contains validation data.

    If you provide this file, the data is used to generate validation
    metrics periodically during fine-tuning. These metrics can be viewed in
    the fine-tuning results file.
    The same data should not be present in both train and validation files.

    Your dataset must be formatted as a JSONL file. You must upload your file with the purpose `fine-tune`.

    See the [fine-tuning guide](https://platform.openai.com/docs/guides/model-optimization) for more details.
      Example: `"file-abc123"`
    """
    (
      @type create_fine_tuning_job_opt() ::
              (((((({:hyperparameters,
                     %{
                       optional(:batch_size) => (:auto | String.t()) | integer(),
                       optional(:learning_rate_multiplier) => (:auto | String.t()) | number(),
                       optional(:n_epochs) => (:auto | String.t()) | integer()
                     }}
                    | {:integrations,
                       list(%{
                         required(:type) => :wandb | String.t(),
                         required(:wandb) => %{
                           optional(:entity) => String.t() | nil,
                           optional(:name) => String.t() | nil,
                           required(:project) => String.t(),
                           optional(:tags) => list(String.t())
                         }
                       })
                       | nil})
                   | {:metadata, ExOpenAI.Components.Metadata.input()})
                  | {:method, ExOpenAI.Components.FineTuneMethod.input()})
                 | {:seed, integer() | nil})
                | {:suffix, String.t() | nil})
               | {:validation_file, String.t() | nil})
              | ExOpenAI.request_option()
      @spec create_fine_tuning_job(
              model ::
                String.t()
                | (((:"babbage-002" | :"davinci-002") | :"gpt-3.5-turbo") | :"gpt-4o-mini")
                | String.t(),
              training_file :: String.t(),
              opts :: [create_fine_tuning_job_opt()]
            ) :: {:ok, ExOpenAI.Components.FineTuningJob.t()} | {:error, any()}
    )

    def create_fine_tuning_job(model, training_file, opts \\ []) do
      url = "/fine_tuning/jobs"
      query_params = Keyword.take(opts, [])
      url = ExOpenAI.Query.append(url, query_params)
      body_params = [model: model, training_file: training_file]

      optional_body_params =
        Keyword.take(opts, [
          :hyperparameters,
          :integrations,
          :metadata,
          :method,
          :seed,
          :suffix,
          :validation_file
        ])

      body_params = body_params ++ optional_body_params

      optional_params_to_drop =
        [:hyperparameters, :integrations, :metadata, :method, :seed, :suffix, :validation_file]
        |> Enum.reject(&(&1 == :stream))

      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/FineTuningJob"}
        )
      end

      nil

      ExOpenAI.Config.http_client().api_call(
        :post,
        url,
        body_params,
        :"application/json",
        opts,
        convert_response
      )
    end
  )

  (
    @doc """
    Get info about a fine-tuning job.

    [Learn more about fine-tuning](https://platform.openai.com/docs/guides/model-optimization)


    ## Parameters

    * `:fine_tuning_job_id` - **required** - `String.t()`
      The ID of the fine-tuning job.
    """
    (
      @type retrieve_fine_tuning_job_opt() :: ExOpenAI.request_option()
      @spec retrieve_fine_tuning_job(
              fine_tuning_job_id :: String.t(),
              opts :: [retrieve_fine_tuning_job_opt()]
            ) :: {:ok, ExOpenAI.Components.FineTuningJob.t()} | {:error, any()}
    )

    def retrieve_fine_tuning_job(fine_tuning_job_id, opts \\ []) do
      url = "/fine_tuning/jobs/{fine_tuning_job_id}"
      url = String.replace(url, "{fine_tuning_job_id}", to_string(fine_tuning_job_id))
      query_params = Keyword.take(opts, [])
      url = ExOpenAI.Query.append(url, query_params)
      body_params = []
      optional_body_params = Keyword.take(opts, [])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/FineTuningJob"}
        )
      end

      nil

      ExOpenAI.Config.http_client().api_call(
        :get,
        url,
        body_params,
        :"application/json",
        opts,
        convert_response
      )
    end
  )

  (
    @doc """
    Immediately cancel a fine-tune job.


    ## Parameters

    * `:fine_tuning_job_id` - **required** - `String.t()`
      The ID of the fine-tuning job to cancel.
    """
    (
      @type cancel_fine_tuning_job_opt() :: ExOpenAI.request_option()
      @spec cancel_fine_tuning_job(
              fine_tuning_job_id :: String.t(),
              opts :: [cancel_fine_tuning_job_opt()]
            ) :: {:ok, ExOpenAI.Components.FineTuningJob.t()} | {:error, any()}
    )

    def cancel_fine_tuning_job(fine_tuning_job_id, opts \\ []) do
      url = "/fine_tuning/jobs/{fine_tuning_job_id}/cancel"
      url = String.replace(url, "{fine_tuning_job_id}", to_string(fine_tuning_job_id))
      query_params = Keyword.take(opts, [])
      url = ExOpenAI.Query.append(url, query_params)
      body_params = []
      optional_body_params = Keyword.take(opts, [])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/FineTuningJob"}
        )
      end

      nil

      ExOpenAI.Config.http_client().api_call(
        :post,
        url,
        body_params,
        :"application/json",
        opts,
        convert_response
      )
    end
  )

  (
    @doc """
    List checkpoints for a fine-tuning job.


    ## Parameters

    * `:fine_tuning_job_id` - **required** - `String.t()`
      The ID of the fine-tuning job to get checkpoints for.

    ## Options

    * `:after` - **optional** - `String.t()`
      Identifier for the last checkpoint ID from the previous pagination request.

    * `:limit` - **optional** - `integer()`
      Number of checkpoints to retrieve.
      Default: `10`
    """
    (
      @type list_fine_tuning_job_checkpoints_opt() ::
              ({:after, String.t()} | {:limit, integer()}) | ExOpenAI.request_option()
      @spec list_fine_tuning_job_checkpoints(
              fine_tuning_job_id :: String.t(),
              opts :: [list_fine_tuning_job_checkpoints_opt()]
            ) ::
              {:ok, ExOpenAI.Components.ListFineTuningJobCheckpointsResponse.t()}
              | {:error, any()}
    )

    def list_fine_tuning_job_checkpoints(fine_tuning_job_id, opts \\ []) do
      url = "/fine_tuning/jobs/{fine_tuning_job_id}/checkpoints"
      url = String.replace(url, "{fine_tuning_job_id}", to_string(fine_tuning_job_id))
      query_params = Keyword.take(opts, [:after, :limit])
      url = ExOpenAI.Query.append(url, query_params)
      body_params = []
      optional_body_params = Keyword.take(opts, [])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [:after, :limit] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{
            ref: "#/components/schemas/ListFineTuningJobCheckpointsResponse"
          }
        )
      end

      nil

      ExOpenAI.Config.http_client().api_call(
        :get,
        url,
        body_params,
        :"application/json",
        opts,
        convert_response
      )
    end
  )

  (
    @doc """
    Get status updates for a fine-tuning job.


    ## Parameters

    * `:fine_tuning_job_id` - **required** - `String.t()`
      The ID of the fine-tuning job to get events for.

    ## Options

    * `:after` - **optional** - `String.t()`
      Identifier for the last event from the previous pagination request.

    * `:limit` - **optional** - `integer()`
      Number of events to retrieve.
      Default: `20`
    """
    (
      @type list_fine_tuning_events_opt() ::
              ({:after, String.t()} | {:limit, integer()}) | ExOpenAI.request_option()
      @spec list_fine_tuning_events(
              fine_tuning_job_id :: String.t(),
              opts :: [list_fine_tuning_events_opt()]
            ) :: {:ok, ExOpenAI.Components.ListFineTuningJobEventsResponse.t()} | {:error, any()}
    )

    def list_fine_tuning_events(fine_tuning_job_id, opts \\ []) do
      url = "/fine_tuning/jobs/{fine_tuning_job_id}/events"
      url = String.replace(url, "{fine_tuning_job_id}", to_string(fine_tuning_job_id))
      query_params = Keyword.take(opts, [:after, :limit])
      url = ExOpenAI.Query.append(url, query_params)
      body_params = []
      optional_body_params = Keyword.take(opts, [])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [:after, :limit] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{
            ref: "#/components/schemas/ListFineTuningJobEventsResponse"
          }
        )
      end

      nil

      ExOpenAI.Config.http_client().api_call(
        :get,
        url,
        body_params,
        :"application/json",
        opts,
        convert_response
      )
    end
  )

  (
    @doc """
    Pause a fine-tune job.


    ## Parameters

    * `:fine_tuning_job_id` - **required** - `String.t()`
      The ID of the fine-tuning job to pause.
    """
    (
      @type pause_fine_tuning_job_opt() :: ExOpenAI.request_option()
      @spec pause_fine_tuning_job(
              fine_tuning_job_id :: String.t(),
              opts :: [pause_fine_tuning_job_opt()]
            ) :: {:ok, ExOpenAI.Components.FineTuningJob.t()} | {:error, any()}
    )

    def pause_fine_tuning_job(fine_tuning_job_id, opts \\ []) do
      url = "/fine_tuning/jobs/{fine_tuning_job_id}/pause"
      url = String.replace(url, "{fine_tuning_job_id}", to_string(fine_tuning_job_id))
      query_params = Keyword.take(opts, [])
      url = ExOpenAI.Query.append(url, query_params)
      body_params = []
      optional_body_params = Keyword.take(opts, [])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/FineTuningJob"}
        )
      end

      nil

      ExOpenAI.Config.http_client().api_call(
        :post,
        url,
        body_params,
        :"application/json",
        opts,
        convert_response
      )
    end
  )

  (
    @doc """
    Resume a fine-tune job.


    ## Parameters

    * `:fine_tuning_job_id` - **required** - `String.t()`
      The ID of the fine-tuning job to resume.
    """
    (
      @type resume_fine_tuning_job_opt() :: ExOpenAI.request_option()
      @spec resume_fine_tuning_job(
              fine_tuning_job_id :: String.t(),
              opts :: [resume_fine_tuning_job_opt()]
            ) :: {:ok, ExOpenAI.Components.FineTuningJob.t()} | {:error, any()}
    )

    def resume_fine_tuning_job(fine_tuning_job_id, opts \\ []) do
      url = "/fine_tuning/jobs/{fine_tuning_job_id}/resume"
      url = String.replace(url, "{fine_tuning_job_id}", to_string(fine_tuning_job_id))
      query_params = Keyword.take(opts, [])
      url = ExOpenAI.Query.append(url, query_params)
      body_params = []
      optional_body_params = Keyword.take(opts, [])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/FineTuningJob"}
        )
      end

      nil

      ExOpenAI.Config.http_client().api_call(
        :post,
        url,
        body_params,
        :"application/json",
        opts,
        convert_response
      )
    end
  )
end
