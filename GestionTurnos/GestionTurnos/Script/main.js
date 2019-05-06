xhr = new XMLHttpRequest()
xhr.onreadystatechange = ->
    if xhr.readyState is 4
$('#ajax').html(xhr.responseText)
xhr.open 'GET', 'jumbotron.html'
xhr.send()