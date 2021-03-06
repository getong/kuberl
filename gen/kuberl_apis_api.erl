-module(kuberl_apis_api).

-export([get_api_versions/1, get_api_versions/2]).

-define(BASE_URL, "").

%% @doc 
%% get available API versions
-spec get_api_versions(ctx:ctx()) -> {ok, kuberl_v1_api_group_list:kuberl_v1_api_group_list(), kuberl_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), kuberl_utils:response_info()}.
get_api_versions(Ctx) ->
    get_api_versions(Ctx, #{}).

-spec get_api_versions(ctx:ctx(), maps:map()) -> {ok, kuberl_v1_api_group_list:kuberl_v1_api_group_list(), kuberl_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), kuberl_utils:response_info()}.
get_api_versions(Ctx, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = ["/apis/"],
    QS = [],
    Headers = [],
    Body1 = [],
    ContentTypeHeader = kuberl_utils:select_header_content_type([<<"application/json">>, <<"application/yaml">>, <<"application/vnd.kubernetes.protobuf">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    kuberl_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).


