function flatpak-run-app
    set app_id nl.jknaapen.fladder
    if test -n "$app_id"
        flatpak run $app_id
    else
        echo "App '$argv[1]' not found"
    end
end

