function repo-ssync --description "T.B.D."
    # repo command is not installed
    if not type -q repo
        echo "fatal: no repo command installed" > /dev/stderr
        return 1
    end

    # fzf command is not installed
    if not type -q fzf
        echo "fatal: no fzf command installed" > /dev/stderr
        return 1
    end

    # executed not in repo repository
    if repo help | grep -q "repo is not yet installed"
        echo "fatal: not a repo repository: .repo" > /dev/stderr
        return 1
    end

    set project_lines (repo manifest | grep '<project' | fzf --multi | string join ' ' | string trim)

    set project_names (echo "$project_lines" | \
        awk -F'name="' '{ for(i=2; i<=NF; i++) {split($i, a, "\""); print a[1]}}')

    if test -n "$project_names"
        echo "repo sync $project_names"
        repo sync $project_names
    else
        echo "No projects selected."
    end
end
