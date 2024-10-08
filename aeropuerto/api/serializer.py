from rest_framework import serializers
from aeropuerto.models import (
    VehiculoAereo, Avion, Avioneta, Helicoptero, Persona, Pasajero, Tripulacion,
    Piloto, Copiloto, Sobrecargo, Aeropuerto, Terminal, Vuelo
)

class VehiculoAereoSerializer(serializers.ModelSerializer):
    class Meta:
        model = VehiculoAereo
        fields = '__all__'

class AvionSerializer(serializers.ModelSerializer):
    class Meta:
        model = Avion
        fields = '__all__'

class AvionetaSerializer(serializers.ModelSerializer):
    class Meta:
        model = Avioneta
        fields = '__all__'

class HelicopteroSerializer(serializers.ModelSerializer):
    class Meta:
        model = Helicoptero
        fields = '__all__'

class PersonaSerializer(serializers.ModelSerializer):
    class Meta:
        model = Persona
        fields = '__all__'

class PasajeroSerializer(serializers.ModelSerializer):
    class Meta:
        model = Pasajero
        fields = '__all__'

class TripulacionSerializer(serializers.ModelSerializer):
    class Meta:
        model = Tripulacion
        fields = '__all__'

class PilotoSerializer(serializers.ModelSerializer):
    class Meta:
        model = Piloto
        fields = '__all__'

class CopilotoSerializer(serializers.ModelSerializer):
    class Meta:
        model = Copiloto
        fields = '__all__'

class SobrecargoSerializer(serializers.ModelSerializer):
    class Meta:
        model = Sobrecargo
        fields = '__all__'

class AeropuertoSerializer(serializers.ModelSerializer):
    class Meta:
        model = Aeropuerto
        fields = '__all__'

class TerminalSerializer(serializers.ModelSerializer):
    class Meta:
        model = Terminal
        fields = '__all__'

class VueloSerializer(serializers.ModelSerializer):
    class Meta:
        model = Vuelo
        fields = '__all__'