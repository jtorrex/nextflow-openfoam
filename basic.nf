process demo {
    echo true

    script:
    """
    echo "Hello world"
    cat /etc/*release
    """
}
