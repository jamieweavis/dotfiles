# Source prompt, aliases and extra
for file in ~/.{bash_prompt,aliases,extra}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;
