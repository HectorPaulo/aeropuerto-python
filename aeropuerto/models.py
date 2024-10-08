from django.db import models

class Terminal(models.Model):
    clave_terminal = models.CharField(max_length=100, default='default_value')
    nombre = models.CharField(max_length=100)
    ubicacion = models.CharField(max_length=100, default='Ubicación por defecto')

    def __str__(self):
        return self.clave_terminal

class VehiculoAereo(models.Model):
    modelo = models.CharField(max_length=100)
    capacidad = models.IntegerField()

    def __str__(self):
        return self.modelo

class Avion(VehiculoAereo):
    aerolinea = models.CharField(max_length=100)
    tipo_motor = models.CharField(max_length=100)
    puertas = models.IntegerField()
    tipo_avion = models.CharField(max_length=100)

    def __str__(self):
        return f"Avión {self.modelo} de {self.aerolinea}"

class Avioneta(VehiculoAereo):
    tipo_helice = models.CharField(max_length=100)

    def __str__(self):
        return f"Avioneta {self.modelo}"

class Helicoptero(VehiculoAereo):
    tipo_rotor = models.CharField(max_length=100)

    def __str__(self):
        return f"Helicóptero {self.modelo}"

class Vuelo(models.Model):
    terminal = models.ForeignKey(Terminal, on_delete=models.CASCADE)
    duracion = models.CharField(max_length=50)

    def __str__(self):
        return f"Vuelo en {self.terminal.nombre} con duración {self.duracion}"

class Persona(models.Model):
    nombre = models.CharField(max_length=100)
    apellido = models.CharField(max_length=100)
    direccion = models.CharField(max_length=200)
    fecha_nacimiento = models.DateField()
    discapacidad = models.CharField(max_length=100, null=True, blank=True)
    nacionalidad = models.CharField(max_length=100)

    def __str__(self):
        return f"{self.nombre} {self.apellido}"

class Pasajero(Persona):
    id_pasajero = models.CharField(max_length=100, unique=True)

    def __str__(self):
        return f"Pasajero {self.id_pasajero}: {self.nombre} {self.apellido}"

class Tripulacion(Persona):
    id_tripulacion = models.CharField(max_length=100, unique=True)
    antiguedad = models.IntegerField()
    turno = models.CharField(max_length=50)
    hrs_vuelo = models.IntegerField()
    genero = models.CharField(max_length=10)

    def __str__(self):
        return f"Tripulación {self.id_tripulacion}: {self.nombre} {self.apellido}"

class Piloto(Tripulacion):
    rango_piloto = models.CharField(max_length=100)
    licencia = models.CharField(max_length=100)
    tipo_aeronave = models.CharField(max_length=100)
    salud_mental = models.CharField(max_length=100)

    def __str__(self):
        return f"Piloto {self.rango_piloto}: {self.nombre} {self.apellido}"

class Copiloto(Tripulacion):
    rango_copiloto = models.CharField(max_length=100)
    tiempo_restante_piloto = models.IntegerField()

    def __str__(self):
        return f"Copiloto {self.rango_copiloto}: {self.nombre} {self.apellido}"

class Sobrecargo(Tripulacion):
    idiomas = models.CharField(max_length=200)
    certificados = models.CharField(max_length=200)

    def __str__(self):
        return f"Sobrecargo: {self.nombre} {self.apellido}"

class Aeropuerto(models.Model):
    clave_aeropuerto = models.CharField(max_length=100)
    nombre = models.CharField(max_length=100)
    num_pistas = models.IntegerField()
    tipo_avion = models.CharField(max_length=100)

    def __str__(self):
        return self.nombre