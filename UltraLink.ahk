;-------- UltraLink.ahk --------
UltraLink(){
    userInput := InputBox("hogePrompt", "hogeTitle", "w100 h100")
    if userInput.Result = "Cancel"
    Goto EndUltraLink
    else {
    str_url_base := "https://jira.kmt.kmtg.net:8443/jira/browse/B55-"
    str_url_add := userInput.Value
    str_url_combined := str_url_base . str_url_add
    Run str_url_combined
    }
    EndUltraLink:
}

; End of File