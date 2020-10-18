function AllTrim(str)
{
    str = str.trim();
    while(str.indexOf('  ') != -1)
    {
        str = str.replace('  ', ' ');
    }
    return str;
}

function DelSpaces(str)
{
    str = str.trim();
    while(str.indexOf(' ') != -1)
    {
        str = str.replace(' ', '');
    }
    return str;
}

function IsInt(str)
{
    var lg = str.length, c, i;
    if (lg == 0)
        return false;
    for (i = 0 ; i < lg ; i++) {
        c = str.charCodeAt(i);
        if ((c < 48) || (c > 57))
            return false;
    }
    return true;
}

function IsAlias(str)
{
    var i, c, lg = str.length;
    if (lg < 1)
        return false;
    str = str.toUpperCase();
    for (i = 0 ; i < lg ; i++) {
        c = str.charCodeAt(i);
        if (((c < 48) && (c != 45) && (c != 46)) || ((c > 57) && (c < 65)) || ((c > 90) && (c != 95)))
            return false;
    }
    return true;
}

function IsDomaine(str)
{
    var i, c, lg = str.length;

    if ((lg < 2) || (str.indexOf('--') != -1) || (str.indexOf('-') == 0) || (str.lastIndexOf('-') == lg - 1))
        return false;
    str = str.toUpperCase();
    for (i = 0 ; i < lg ; i++) {
        c = str.charCodeAt(i);
        if (((c < 48) && (c != 45) && (c != 46)) || ((c > 57) && (c < 65)) || (c > 90))
            return false;
    }
    return true;
}

function IsExtension(str)
{
    var lg = str.length, c, i;
    if (lg < 2)
        return false;
    str = str.toUpperCase();
    for (i = 0 ; i < lg ; i++) {
        c = str.charCodeAt(i);
        if ((c < 65) || (c > 90))
            return false;
    }
    return true;
}

function IsEmail(str)
{
    var T, U, lg = str.length;

    if (lg < 7)
        return false;
    T = str.split('@');
    if (T.length != 2)
        return false;
    U = T[1].split('.');
    if ((U.length != 2) && (U.length != 3))
        return false;

    if (!IsAlias(T[0]))
        return false;
    if (!IsDomaine(U[0]))
        return false;
    if (!IsExtension(U[1]))
        return false;
    if ((U.length == 3) && (!IsExtension(U[2])))
        return false;
    return true;
}

function IsDate(str)
{
    var T, j, m, a, lg = str.length, i;
    var TM = new Array(0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
    if (lg != 10)
        return false;
    T = str.split('/');
    if (T.length != 3)
        return false;
    for (i = 0 ; i < 3 ; i++) {
        if (!IsInt(T[i]))
            return false;
        T[i] = parseInt(T[i]);
    }
    if ((T[1] < 1) || (T[1] > 12))
        return false;
    if (T[2] % 4 == 0)
        TM[2] = 29;
    if ((T[0] < 1) || (T[0] > TM[T[1]]))
        return false;
    return true;
}
