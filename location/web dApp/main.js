const findMyLocation  = () => {

    const status = document.querySelector('.status')

    const success = (postion) => {
        console.log(postion)
        const latitude = postion.coords.latitude
        const longtitude = postion.coords.longtitude
        console.log(latitude + '' + longtitude)
    }
    const error = (postion) => {
        status.textContent= "not able to get location"
    }
    navigator.geolocation.getCurrentPosition(su)
    
}