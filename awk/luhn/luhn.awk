BEGIN { FS = "" }

/[^0-9 ]+/ {
    print "false"
    exit
}

{
    input = $0
    gsub(" ", "", input);
    len = length(input)

    if (len <= 1) {
        print "false"
        exit
    }

    for (i = 0; i < len; i++) {
        digit = substr(input, len-i, 1);

        if (i % 2 != 0)
            digit *= 2;

        sum += (digit > 9 ? digit-9 : digit)
    }

    print (sum % 10 == 0 ? "true" : "false")
}
