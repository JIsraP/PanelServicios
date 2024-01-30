<?php
require '../vendor/autoload.php';

use Slim\Factory\AppFactory;
use Slim\Psr7\Response;
use Psr\Http\Message\ResponseInterface as ResponseInterface;
use Psr\Http\Message\ServerRequestInterface as RequestInterface;
use Psr\Http\Server\MiddlewareInterface as MiddlewareInterface;
use Psr\Http\Server\RequestHandlerInterface as RequestHandlerInterface;

// Establecer conexión a la base de datos
$servername = "localhost";
$username = "root";
$password = "I1330";
$database = "bdxubes";

$conn = new mysqli($servername, $username, $password, $database);

// Verificar la conexión
if ($conn->connect_error) {
    die("Error de conexión: " . $conn->connect_error);
}

// Crear una instancia de la aplicación Slim
$app = AppFactory::create();

// Middleware para habilitar CORS
$app->add(new class implements MiddlewareInterface {
    public function process(RequestInterface $request, RequestHandlerInterface $handler): ResponseInterface {
        // Permitir solicitudes desde cualquier origen
        $response = $handler->handle($request);
        $response = $response->withHeader('Access-Control-Allow-Origin', '*')
            ->withHeader('Access-Control-Allow-Headers', 'Content-Type, Authorization')
            ->withHeader('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE, OPTIONS');

        // var_dump('CORS Middleware ejecutado'); // Esta línea ya no es necesaria

        return $response;
    }
});


// Definir una ruta de la API para obtener datos desde la base de datos
$app->get('/user', function (RequestInterface $request, ResponseInterface $response) use ($conn) {
    $query = "SELECT * FROM usuario";
    $result = $conn->query($query);

    $datos = array();

    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            $datos[] = $row;
        }
    }

    // Utilizar la implementación de PSR-7 proporcionada por Slim
    $response->getBody()->write(json_encode(['usuarios' => $datos]));

    return $response->withHeader('Content-Type', 'application/json');
});

// Ejecutar la aplicación Slim
$app->run();

// Cerrar la conexión después de usarla
$conn->close();
?>