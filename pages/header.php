<nav class="navbar navbar-expand-lg navbar-light" style="background-color: #e3f2fd;">
    <a class="navbar-brand" href="">Kho Sách</a>
    <button class="navbar-toggler d-lg-none" type="button" data-toggle="collapse" data-target="#collapsibleNavId" aria-controls="collapsibleNavId" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="collapsibleNavId">
        <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
            <li class="nav-item active">
                <a class="nav-link" href="index.php">Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="index.php?controller=sach&action=tatca">Tat ca sach</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="admin/">Admins</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="index.php?controller=sach&action=about">About</a>
            </li>
        </ul>
        <form class="form-inline my-2 my-lg-0" action='index.php' method='get'>
            <input type="hidden" name='controller' value='sach'>
            <input type="hidden" name='action' value='search'>
            <input class="form-control mr-sm-2" type="text" placeholder="Search" name='kw'>
            <button class="btn btn-outline-success my-2 my-sm-0 " type="submit">Search</button>
        </form>
    </div>

</nav>