function llamarAPI() {
    fetch('http://localhost:8000/user')
        .then(response => response.text()) // Obtener el contenido de la respuesta como texto
        .then(data => {
            try {
                // Intentar analizar el contenido como JSON
                const jsonData = JSON.parse(data);
                document.getElementById('respuesta').innerText = JSON.stringify(jsonData.usuarios, null, 2);
            } catch (error) {
                console.error('Error al analizar JSON:', error);
            }
        })
        .catch(error => console.error('Error:', error));
}
