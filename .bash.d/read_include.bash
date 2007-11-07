function read_include()
{
    gcc -E "$@" | vim -
}
