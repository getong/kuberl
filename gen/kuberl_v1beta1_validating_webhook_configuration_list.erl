-module(kuberl_v1beta1_validating_webhook_configuration_list).

-export([encode/1]).

-export_type([kuberl_v1beta1_validating_webhook_configuration_list/0]).

-type kuberl_v1beta1_validating_webhook_configuration_list() ::
    #{ 'apiVersion' => binary(),
       'items' := list(),
       'kind' => binary(),
       'metadata' => kuberl_v1_list_meta:kuberl_v1_list_meta()
     }.

encode(#{ 'apiVersion' := ApiVersion,
          'items' := Items,
          'kind' := Kind,
          'metadata' := Metadata
        }) ->
    #{ 'apiVersion' => ApiVersion,
       'items' => Items,
       'kind' => Kind,
       'metadata' => Metadata
     }.
