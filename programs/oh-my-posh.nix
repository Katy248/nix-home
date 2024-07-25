{ config, pkgs, ... }: {
  programs.oh-my-posh = {
    enable = true;
    # useTheme = "gruvbox";

    enableBashIntegration = true;
    enableZshIntegration = true;

    settings = builtins.fromJSON ''
        {
          "$schema": "https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/schema.json",
          "blocks": [
              {
                  "type": "prompt",
                  "newline": true,
                  "alignment": "left",
                  "overflow": "hide",
                  "segments": [
                      {
                          "template": "{{if .SSHSession}}<cyan>SSH: </>{{end}}{{if .Root}}<lightRed>{{ .UserName }}</>{{else}}{{.UserName}}{{end}}<white>@</>{{ .HostName }}",
                          "style": "plain",
                          "type": "session",
                          "foreground": "lightWhite"
                      },
                      {
                          "type": "path",
                          "foreground": "blue",
                          "properties": {
                              "style": "full"
                          }
                      },
                      {
                          "type": "git",
                          "template": " {{ .HEAD }}{{if .BranchStatus }} {{ .BranchStatus }}{{ end }}{{ if .Working.Changed }}  {{ .Working.String }}{{ end }}{{ if and (.Working.Changed) (.Staging.Changed) }} |{{ end }}{{ if .Staging.Changed }}  {{ .Staging.String }}{{ end }}{{ if gt .StashCount 0 }}  {{ .StashCount }}{{ end }}",
                          "foreground":"green",
                          "foreground_templates": [
                            "{{ if .Working.Changed }}yellow{{ end }}"
                          ],
                          "properties": {
                              "branch_icon": "",
                              "style": "full"
                          }
                      }
                  ]
              },
              {
                  "type": "prompt",
                  "newline": true,
                  "alignment": "left",
                  "segments": [
                      {
                          "style": "plain",
                          "foreground": "blue",
                          "type": "text",
                          "template": "-->"
                      }
                  ]
              }
          ],
          "secondary_prompt": {
              "foreground": "lightBlue",
              "template": "|-> "
          },
          "transient_prompt": {
            "foreground": "blue",
            "foreground_templates": [
              "{{if eq .Code 0}}blue{{else}}red{{end}}"
            ],
            "template": "--> "
          },
          "final_space": true,
          "version": 2
      }
    '';

    #settings = let
    #  themeUrl = {
    #    url =
    #      "https://raw.githubusercontent.com/Katy248/kvtheme/master/theme.omp.json";
    #    sha256 =
    #      "cf0cb1e4247819ca008776ad458d0545dcb689c11860cd958560022aa609cd28";
    #  };
    #in builtins.fromJSON (builtins.unsafeDiscardStringContext
    #  (builtins.readFile (builtins.fetchurl themeUrl)));
  };
}
