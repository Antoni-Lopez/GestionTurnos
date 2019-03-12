Public Class ClaseGeneral

    Public Sub MeterFicherosBootstrap(Optional ByRef bootstrap_min_css As Literal = Nothing, Optional ByRef bootstrap_datetimepicker_min_css As Literal = Nothing, Optional ByRef jquery_1_9_1_min_js As Literal = Nothing, Optional ByRef bootstrap_min_js As Literal = Nothing, Optional ByRef bootstrap_datetimepicker_js As Literal = Nothing, Optional ByRef bootbox_min_js As Literal = Nothing, Optional ByRef bootstrap_datetimepicker_es_js As Literal = Nothing, Optional ByVal FicarNouPath As String = "../../bootstrap/", Optional ByRef bootstrap_datetimepicker_fr_js As Literal = Nothing, Optional ByRef icheck_bootstrap_min_css As Literal = Nothing, Optional ByRef segmented_controls_css As Literal = Nothing, Optional ByRef bootstrap_min_js2 As Literal = Nothing, Optional ByRef jquery_ui_min_css As Literal = Nothing, Optional ByRef jquery_ui_min_js As Literal = Nothing, Optional ByRef particles_js As Literal = Nothing, Optional ByRef particles_app_js As Literal = Nothing, Optional ByRef font_awesome_css As Literal = Nothing, Optional ByRef loader_css As Literal = Nothing, Optional ByRef iframe_sizer_min_js As Literal = Nothing, Optional ByRef iframe_resizer_contentwindow_min_js As Literal = Nothing)
        If Not IsNothing(bootstrap_min_css) Then bootstrap_min_css.Text = "<link href='" & FicarNouPath & "css/bootstrap.min.css' rel='stylesheet' media='screen'>"
        If Not IsNothing(bootstrap_datetimepicker_min_css) Then bootstrap_datetimepicker_min_css.Text = "<link href='" & FicarNouPath & "css/bootstrap-datetimepicker.min.css' rel='stylesheet' media='screen'>"
        If Not IsNothing(jquery_1_9_1_min_js) Then jquery_1_9_1_min_js.Text = "<script type='text/javascript' src='" & FicarNouPath & "js/jquery-1.9.1.min.js' charset='UTF-8'></script>"
        If Not IsNothing(bootstrap_min_js) Then bootstrap_min_js.Text = "<script type='text/javascript' src='" & FicarNouPath & "js/bootstrap.min.js'></script>"
        If Not IsNothing(bootstrap_datetimepicker_js) Then bootstrap_datetimepicker_js.Text = "<script type='text/javascript' src='" & FicarNouPath & "js/bootstrap-datetimepicker.js' charset='UTF-8'></script>"
        If Not IsNothing(bootbox_min_js) Then bootbox_min_js.Text = "<script type='text/javascript' src='" & FicarNouPath & "js/bootbox.min.js'></script>"
        If Not IsNothing(bootstrap_datetimepicker_es_js) Then bootstrap_datetimepicker_es_js.Text = "<script type='text/javascript' src='" & FicarNouPath & "locales/bootstrap-datetimepicker.es.js' charset='UTF-8'></script>"
        If Not IsNothing(bootstrap_datetimepicker_fr_js) Then bootstrap_datetimepicker_fr_js.Text = "<script type='text/javascript' src='" & FicarNouPath & "locales/bootstrap-datetimepicker.fr.js' charset='UTF-8'></script>"
        If Not IsNothing(icheck_bootstrap_min_css) Then icheck_bootstrap_min_css.Text = "<link href='" & FicarNouPath & "css/icheck-bootstrap.min.css' rel='stylesheet' media='screen'>"
        If Not IsNothing(segmented_controls_css) Then segmented_controls_css.Text = "<link href='" & FicarNouPath & "css/segmented-controls2.css' rel='stylesheet' media='screen'>"
        If Not IsNothing(bootstrap_min_js2) Then bootstrap_min_js2.Text = "<script type='text/javascript' src='https://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js'></script>"
        If Not IsNothing(jquery_ui_min_css) Then jquery_ui_min_css.Text = "<link href='" & FicarNouPath & "css/jquery-ui.min.css' rel='stylesheet' media='screen'>"
        If Not IsNothing(jquery_ui_min_js) Then jquery_ui_min_js.Text = "<script type='text/javascript' src='" & FicarNouPath & "js/jquery-ui.min.js'></script>"
        If Not IsNothing(particles_js) Then particles_js.Text = "<script type='text/javascript' src='" & FicarNouPath & "js/particles.js' charset='UTF-8'></script>"
        If Not IsNothing(particles_app_js) Then particles_app_js.Text = "<script type='text/javascript' src='" & FicarNouPath & "js/app.js' charset='UTF-8'></script>"
        If Not IsNothing(font_awesome_css) Then font_awesome_css.Text = "<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.0.13/css/all.css' integrity='sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp' crossorigin='anonymous'>"
        If Not IsNothing(loader_css) Then loader_css.Text = "<link href='" & FicarNouPath & "css/loader.css' rel='stylesheet' media='screen'>"
        If Not IsNothing(iframe_sizer_min_js) Then iframe_sizer_min_js.Text = "<script type='text/javascript' src='" & FicarNouPath & "js/iframeSizer.min.js' charset='UTF-8'></script>"
        If Not IsNothing(iframe_resizer_contentwindow_min_js) Then iframe_resizer_contentwindow_min_js.Text = "<script type='text/javascript' src='" & FicarNouPath & "js/iframeResizer.contentWindow.min.js' charset='UTF-8'></script>"
    End Sub

End Class
