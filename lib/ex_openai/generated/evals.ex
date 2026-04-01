defmodule ExOpenAI.Evals do
  @moduledoc false
  (
    @doc """
    List evaluations for a project.


    ## Options

    * `:after` - **optional** - `String.t()`  
      Identifier for the last eval from the previous pagination request.

    * `:limit` - **optional** - `integer()`  
      Number of evals to retrieve.  
      Default: `20`

    * `:order` - **optional** - `String.t()`  
      Sort order for evals by timestamp. Use `asc` for ascending order or `desc` for descending order.  
      Allowed values: `"asc"`, `"desc"`  
      Default: `"asc"`

    * `:order_by` - **optional** - `String.t()`  
      Evals can be ordered by creation time or last updated time. Use
    `created_at` for creation time or `updated_at` for last updated time.  
      Allowed values: `"created_at"`, `"updated_at"`  
      Default: `"created_at"`
    """
    @spec list_evals(
            opts :: [
              (({:after, String.t()} | {:limit, integer()}) | {:order, String.t()})
              | {:order_by, String.t()}
            ]
          ) :: {:ok, ExOpenAI.Components.EvalList.t()} | {:error, any()}
    def list_evals(opts \\ []) do
      url = "/evals"
      query_params = Keyword.take(opts, [:after, :limit, :order, :order_by])

      query_string =
        if length(query_params) > 0 do
          "?" <> URI.encode_query(query_params)
        else
          ""
        end

      url = url <> query_string
      body_params = []
      optional_body_params = Keyword.take(opts, [:after, :limit, :order, :order_by])
      body_params = body_params ++ optional_body_params

      optional_params_to_drop =
        [:after, :limit, :order, :order_by] |> Enum.reject(&(&1 == :stream))

      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(response, %{
          __struct__: ExOpenAI.Codegen.DocsParser.Schema,
          additional_properties: nil,
          all_of: nil,
          any_of: nil,
          default: nil,
          deprecated: nil,
          description: nil,
          discriminator: nil,
          enum: nil,
          example: nil,
          format: nil,
          items: nil,
          name: nil,
          nullable: nil,
          one_of: nil,
          properties: nil,
          raw: nil,
          read_only: nil,
          ref: "#/components/schemas/EvalList",
          required: nil,
          type: nil,
          write_only: nil
        })
      end

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
    Create the structure of an evaluation that can be used to test a model's performance.
    An evaluation is a set of testing criteria and the config for a data source, which dictates the schema of the data used in the evaluation. After creating an evaluation, you can run it on different models and model parameters. We support several types of graders and datasources.
    For more information, see the [Evals guide](/docs/guides/evals).


    ## Parameters

    * `data_source_config` - **required** - `map()`  
      The configuration for the data source used for the evaluation runs. Dictates the schema of the data used in the evaluation.

    * `testing_criteria` - **required** - `[any() | any() | any() | any() | any()]`  
      A list of graders for all eval runs in this group. Graders can reference variables in the data source using double curly braces notation, like `{{item.variable_name}}`. To reference the model's output, use the `sample` namespace (ie, `{{sample.output_text}}`).

    ## Options

    * `metadata` - **optional** - `any()`

    * `name` - **optional** - `String.t()`  
      The name of the evaluation.
    """
    @spec create_eval(
            data_source_config :: map(),
            testing_criteria ::
              list(
                (((ExOpenAI.Components.CreateEvalLabelModelGrader.t()
                   | ExOpenAI.Components.EvalGraderStringCheck.t())
                  | ExOpenAI.Components.EvalGraderTextSimilarity.t())
                 | ExOpenAI.Components.EvalGraderPython.t())
                | ExOpenAI.Components.EvalGraderScoreModel.t()
              ),
            opts :: [{:metadata, ExOpenAI.Components.Metadata.t()} | {:name, String.t()}]
          ) :: {:ok, map()} | {:error, any()}
    def create_eval(data_source_config, testing_criteria, opts \\ []) do
      url = "/evals"
      query_params = Keyword.take(opts, [])

      query_string =
        if length(query_params) > 0 do
          "?" <> URI.encode_query(query_params)
        else
          ""
        end

      url = url <> query_string
      body_params = [data_source_config: data_source_config, testing_criteria: testing_criteria]
      optional_body_params = Keyword.take(opts, [:metadata, :name])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [:metadata, :name] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(response, nil)
      end

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
    Delete an evaluation.


    ## Parameters

    * `:eval_id` - **required** - `String.t()`  
      The ID of the evaluation to delete.
    """
    @spec delete_eval(eval_id :: String.t(), opts :: keyword()) :: {:ok, map()} | {:error, any()}
    def delete_eval(eval_id, opts \\ []) do
      url = "/evals/{eval_id}"
      url = String.replace(url, "{eval_id}", to_string(eval_id))
      query_params = Keyword.take(opts, [])

      query_string =
        if length(query_params) > 0 do
          "?" <> URI.encode_query(query_params)
        else
          ""
        end

      url = url <> query_string
      body_params = []
      optional_body_params = Keyword.take(opts, [])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(response, nil)
      end

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
    Get an evaluation by ID.


    ## Parameters

    * `:eval_id` - **required** - `String.t()`  
      The ID of the evaluation to retrieve.
    """
    @spec get_eval(eval_id :: String.t(), opts :: keyword()) ::
            {:ok, ExOpenAI.Components.Eval.t()} | {:error, any()}
    def get_eval(eval_id, opts \\ []) do
      url = "/evals/{eval_id}"
      url = String.replace(url, "{eval_id}", to_string(eval_id))
      query_params = Keyword.take(opts, [])

      query_string =
        if length(query_params) > 0 do
          "?" <> URI.encode_query(query_params)
        else
          ""
        end

      url = url <> query_string
      body_params = []
      optional_body_params = Keyword.take(opts, [])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(response, %{
          __struct__: ExOpenAI.Codegen.DocsParser.Schema,
          additional_properties: nil,
          all_of: nil,
          any_of: nil,
          default: nil,
          deprecated: nil,
          description: nil,
          discriminator: nil,
          enum: nil,
          example: nil,
          format: nil,
          items: nil,
          name: nil,
          nullable: nil,
          one_of: nil,
          properties: nil,
          raw: nil,
          read_only: nil,
          ref: "#/components/schemas/Eval",
          required: nil,
          type: nil,
          write_only: nil
        })
      end

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
    Update certain properties of an evaluation.


    ## Parameters

    * `:eval_id` - **required** - `String.t()`  
      The ID of the evaluation to update.
    """
    @spec update_eval(eval_id :: String.t(), opts :: keyword()) ::
            {:ok, ExOpenAI.Components.Eval.t()} | {:error, any()}
    def update_eval(eval_id, opts \\ []) do
      url = "/evals/{eval_id}"
      url = String.replace(url, "{eval_id}", to_string(eval_id))
      query_params = Keyword.take(opts, [])

      query_string =
        if length(query_params) > 0 do
          "?" <> URI.encode_query(query_params)
        else
          ""
        end

      url = url <> query_string
      body_params = []
      optional_body_params = Keyword.take(opts, [])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(response, %{
          __struct__: ExOpenAI.Codegen.DocsParser.Schema,
          additional_properties: nil,
          all_of: nil,
          any_of: nil,
          default: nil,
          deprecated: nil,
          description: nil,
          discriminator: nil,
          enum: nil,
          example: nil,
          format: nil,
          items: nil,
          name: nil,
          nullable: nil,
          one_of: nil,
          properties: nil,
          raw: nil,
          read_only: nil,
          ref: "#/components/schemas/Eval",
          required: nil,
          type: nil,
          write_only: nil
        })
      end

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
    Get a list of runs for an evaluation.


    ## Parameters

    * `:eval_id` - **required** - `String.t()`  
      The ID of the evaluation to retrieve runs for.

    ## Options

    * `:after` - **optional** - `String.t()`  
      Identifier for the last run from the previous pagination request.

    * `:limit` - **optional** - `integer()`  
      Number of runs to retrieve.  
      Default: `20`

    * `:order` - **optional** - `String.t()`  
      Sort order for runs by timestamp. Use `asc` for ascending order or `desc` for descending order. Defaults to `asc`.  
      Allowed values: `"asc"`, `"desc"`  
      Default: `"asc"`

    * `:status` - **optional** - `String.t()`  
      Filter runs by status. One of `queued` | `in_progress` | `failed` | `completed` | `canceled`.  
      Allowed values: `"queued"`, `"in_progress"`, `"completed"`, `"canceled"`, `"failed"`
    """
    @spec get_eval_runs(
            eval_id :: String.t(),
            opts :: [
              (({:after, String.t()} | {:limit, integer()}) | {:order, String.t()})
              | {:status, String.t()}
            ]
          ) :: {:ok, ExOpenAI.Components.EvalRunList.t()} | {:error, any()}
    def get_eval_runs(eval_id, opts \\ []) do
      url = "/evals/{eval_id}/runs"
      url = String.replace(url, "{eval_id}", to_string(eval_id))
      query_params = Keyword.take(opts, [:after, :limit, :order, :status])

      query_string =
        if length(query_params) > 0 do
          "?" <> URI.encode_query(query_params)
        else
          ""
        end

      url = url <> query_string
      body_params = []
      optional_body_params = Keyword.take(opts, [:after, :limit, :order, :status])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [:after, :limit, :order, :status] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(response, %{
          __struct__: ExOpenAI.Codegen.DocsParser.Schema,
          additional_properties: nil,
          all_of: nil,
          any_of: nil,
          default: nil,
          deprecated: nil,
          description: nil,
          discriminator: nil,
          enum: nil,
          example: nil,
          format: nil,
          items: nil,
          name: nil,
          nullable: nil,
          one_of: nil,
          properties: nil,
          raw: nil,
          read_only: nil,
          ref: "#/components/schemas/EvalRunList",
          required: nil,
          type: nil,
          write_only: nil
        })
      end

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
    Kicks off a new run for a given evaluation, specifying the data source, and what model configuration to use to test. The datasource will be validated against the schema specified in the config of the evaluation.


    ## Parameters

    * `:eval_id` - **required** - `String.t()`  
      The ID of the evaluation to create a run for.

    * `data_source` - **required** - `map()`  
      Details about the run's data source.

    ## Options

    * `metadata` - **optional** - `any()`

    * `name` - **optional** - `String.t()`  
      The name of the run.
    """
    @spec create_eval_run(
            data_source :: map(),
            eval_id :: String.t(),
            opts :: [{:metadata, ExOpenAI.Components.Metadata.t()} | {:name, String.t()}]
          ) :: {:ok, map()} | {:error, any()}
    def create_eval_run(data_source, eval_id, opts \\ []) do
      url = "/evals/{eval_id}/runs"
      url = String.replace(url, "{eval_id}", to_string(eval_id))
      query_params = Keyword.take(opts, [])

      query_string =
        if length(query_params) > 0 do
          "?" <> URI.encode_query(query_params)
        else
          ""
        end

      url = url <> query_string
      body_params = [data_source: data_source]
      optional_body_params = Keyword.take(opts, [:metadata, :name])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [:metadata, :name] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(response, nil)
      end

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
    Delete an eval run.


    ## Parameters

    * `:eval_id` - **required** - `String.t()`  
      The ID of the evaluation to delete the run from.

    * `:run_id` - **required** - `String.t()`  
      The ID of the run to delete.
    """
    @spec delete_eval_run(eval_id :: String.t(), run_id :: String.t(), opts :: keyword()) ::
            {:ok, map()} | {:error, any()}
    def delete_eval_run(eval_id, run_id, opts \\ []) do
      url = "/evals/{eval_id}/runs/{run_id}"
      url = String.replace(url, "{eval_id}", to_string(eval_id))
      url = String.replace(url, "{run_id}", to_string(run_id))
      query_params = Keyword.take(opts, [])

      query_string =
        if length(query_params) > 0 do
          "?" <> URI.encode_query(query_params)
        else
          ""
        end

      url = url <> query_string
      body_params = []
      optional_body_params = Keyword.take(opts, [])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(response, nil)
      end

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
    Get an evaluation run by ID.


    ## Parameters

    * `:eval_id` - **required** - `String.t()`  
      The ID of the evaluation to retrieve runs for.

    * `:run_id` - **required** - `String.t()`  
      The ID of the run to retrieve.
    """
    @spec get_eval_run(eval_id :: String.t(), run_id :: String.t(), opts :: keyword()) ::
            {:ok, ExOpenAI.Components.EvalRun.t()} | {:error, any()}
    def get_eval_run(eval_id, run_id, opts \\ []) do
      url = "/evals/{eval_id}/runs/{run_id}"
      url = String.replace(url, "{eval_id}", to_string(eval_id))
      url = String.replace(url, "{run_id}", to_string(run_id))
      query_params = Keyword.take(opts, [])

      query_string =
        if length(query_params) > 0 do
          "?" <> URI.encode_query(query_params)
        else
          ""
        end

      url = url <> query_string
      body_params = []
      optional_body_params = Keyword.take(opts, [])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(response, %{
          __struct__: ExOpenAI.Codegen.DocsParser.Schema,
          additional_properties: nil,
          all_of: nil,
          any_of: nil,
          default: nil,
          deprecated: nil,
          description: nil,
          discriminator: nil,
          enum: nil,
          example: nil,
          format: nil,
          items: nil,
          name: nil,
          nullable: nil,
          one_of: nil,
          properties: nil,
          raw: nil,
          read_only: nil,
          ref: "#/components/schemas/EvalRun",
          required: nil,
          type: nil,
          write_only: nil
        })
      end

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
    Cancel an ongoing evaluation run.


    ## Parameters

    * `:eval_id` - **required** - `String.t()`  
      The ID of the evaluation whose run you want to cancel.

    * `:run_id` - **required** - `String.t()`  
      The ID of the run to cancel.
    """
    @spec cancel_eval_run(eval_id :: String.t(), run_id :: String.t(), opts :: keyword()) ::
            {:ok, ExOpenAI.Components.EvalRun.t()} | {:error, any()}
    def cancel_eval_run(eval_id, run_id, opts \\ []) do
      url = "/evals/{eval_id}/runs/{run_id}"
      url = String.replace(url, "{eval_id}", to_string(eval_id))
      url = String.replace(url, "{run_id}", to_string(run_id))
      query_params = Keyword.take(opts, [])

      query_string =
        if length(query_params) > 0 do
          "?" <> URI.encode_query(query_params)
        else
          ""
        end

      url = url <> query_string
      body_params = []
      optional_body_params = Keyword.take(opts, [])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(response, %{
          __struct__: ExOpenAI.Codegen.DocsParser.Schema,
          additional_properties: nil,
          all_of: nil,
          any_of: nil,
          default: nil,
          deprecated: nil,
          description: nil,
          discriminator: nil,
          enum: nil,
          example: nil,
          format: nil,
          items: nil,
          name: nil,
          nullable: nil,
          one_of: nil,
          properties: nil,
          raw: nil,
          read_only: nil,
          ref: "#/components/schemas/EvalRun",
          required: nil,
          type: nil,
          write_only: nil
        })
      end

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
    Get a list of output items for an evaluation run.


    ## Parameters

    * `:eval_id` - **required** - `String.t()`  
      The ID of the evaluation to retrieve runs for.

    * `:run_id` - **required** - `String.t()`  
      The ID of the run to retrieve output items for.

    ## Options

    * `:after` - **optional** - `String.t()`  
      Identifier for the last output item from the previous pagination request.

    * `:limit` - **optional** - `integer()`  
      Number of output items to retrieve.  
      Default: `20`

    * `:status` - **optional** - `String.t()`  
      Filter output items by status. Use `failed` to filter by failed output
    items or `pass` to filter by passed output items.  
      Allowed values: `"fail"`, `"pass"`

    * `:order` - **optional** - `String.t()`  
      Sort order for output items by timestamp. Use `asc` for ascending order or `desc` for descending order. Defaults to `asc`.  
      Allowed values: `"asc"`, `"desc"`  
      Default: `"asc"`
    """
    @spec get_eval_run_output_items(
            eval_id :: String.t(),
            run_id :: String.t(),
            opts :: [
              (({:after, String.t()} | {:limit, integer()}) | {:status, String.t()})
              | {:order, String.t()}
            ]
          ) :: {:ok, ExOpenAI.Components.EvalRunOutputItemList.t()} | {:error, any()}
    def get_eval_run_output_items(eval_id, run_id, opts \\ []) do
      url = "/evals/{eval_id}/runs/{run_id}/output_items"
      url = String.replace(url, "{eval_id}", to_string(eval_id))
      url = String.replace(url, "{run_id}", to_string(run_id))
      query_params = Keyword.take(opts, [:after, :limit, :status, :order])

      query_string =
        if length(query_params) > 0 do
          "?" <> URI.encode_query(query_params)
        else
          ""
        end

      url = url <> query_string
      body_params = []
      optional_body_params = Keyword.take(opts, [:after, :limit, :order, :status])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [:after, :limit, :order, :status] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(response, %{
          __struct__: ExOpenAI.Codegen.DocsParser.Schema,
          additional_properties: nil,
          all_of: nil,
          any_of: nil,
          default: nil,
          deprecated: nil,
          description: nil,
          discriminator: nil,
          enum: nil,
          example: nil,
          format: nil,
          items: nil,
          name: nil,
          nullable: nil,
          one_of: nil,
          properties: nil,
          raw: nil,
          read_only: nil,
          ref: "#/components/schemas/EvalRunOutputItemList",
          required: nil,
          type: nil,
          write_only: nil
        })
      end

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
    Get an evaluation run output item by ID.


    ## Parameters

    * `:eval_id` - **required** - `String.t()`  
      The ID of the evaluation to retrieve runs for.

    * `:run_id` - **required** - `String.t()`  
      The ID of the run to retrieve.

    * `:output_item_id` - **required** - `String.t()`  
      The ID of the output item to retrieve.
    """
    @spec get_eval_run_output_item(
            eval_id :: String.t(),
            output_item_id :: String.t(),
            run_id :: String.t(),
            opts :: keyword()
          ) :: {:ok, ExOpenAI.Components.EvalRunOutputItem.t()} | {:error, any()}
    def get_eval_run_output_item(eval_id, output_item_id, run_id, opts \\ []) do
      url = "/evals/{eval_id}/runs/{run_id}/output_items/{output_item_id}"
      url = String.replace(url, "{eval_id}", to_string(eval_id))
      url = String.replace(url, "{run_id}", to_string(run_id))
      url = String.replace(url, "{output_item_id}", to_string(output_item_id))
      query_params = Keyword.take(opts, [])

      query_string =
        if length(query_params) > 0 do
          "?" <> URI.encode_query(query_params)
        else
          ""
        end

      url = url <> query_string
      body_params = []
      optional_body_params = Keyword.take(opts, [])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(response, %{
          __struct__: ExOpenAI.Codegen.DocsParser.Schema,
          additional_properties: nil,
          all_of: nil,
          any_of: nil,
          default: nil,
          deprecated: nil,
          description: nil,
          discriminator: nil,
          enum: nil,
          example: nil,
          format: nil,
          items: nil,
          name: nil,
          nullable: nil,
          one_of: nil,
          properties: nil,
          raw: nil,
          read_only: nil,
          ref: "#/components/schemas/EvalRunOutputItem",
          required: nil,
          type: nil,
          write_only: nil
        })
      end

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
end
