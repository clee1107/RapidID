Deploy Module {
    By PSGalleryModule {
        FromSource Build\RapidID
        To PSGallery
        WithOptions @{
            ApiKey = $ENV:PSGalleryKey
        }
    }
}