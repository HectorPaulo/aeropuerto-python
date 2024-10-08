from rest_framework import viewsets
from aeropuerto.models import Avioneta, Avion, VehiculoAereo, Helicoptero, Persona, Pasajero, Tripulacion, Piloto, Copiloto, Sobrecargo, Aeropuerto, Terminal, Vuelo
from aeropuerto.api.serializer import AvionetaSerializer, AvionSerializer, VehiculoAereoSerializer, HelicopteroSerializer, PersonaSerializer, PasajeroSerializer, TripulacionSerializer, PilotoSerializer, CopilotoSerializer, SobrecargoSerializer, AeropuertoSerializer, TerminalSerializer, VueloSerializer

class AvionetaViewSet(viewsets.ModelViewSet):
    queryset = Avioneta.objects.all()
    serializer_class = AvionetaSerializer

class AvionViewSet(viewsets.ModelViewSet):
    queryset = Avion.objects.all()
    serializer_class = AvionSerializer

class VehiculoAereoViewSet(viewsets.ModelViewSet):
    queryset = VehiculoAereo.objects.all()
    serializer_class = VehiculoAereoSerializer

class HelicopteroViewSet(viewsets.ModelViewSet):
    queryset = Helicoptero.objects.all()
    serializer_class = HelicopteroSerializer

class PersonaViewSet(viewsets.ModelViewSet):
    queryset = Persona.objects.all()
    serializer_class = PersonaSerializer

class PasajeroViewSet(viewsets.ModelViewSet):
    queryset = Pasajero.objects.all()
    serializer_class = PasajeroSerializer

class TripulacionViewSet(viewsets.ModelViewSet):
    queryset = Tripulacion.objects.all()
    serializer_class = TripulacionSerializer

class PilotoViewSet(viewsets.ModelViewSet):
    queryset = Piloto.objects.all()
    serializer_class = PilotoSerializer

class CopilotoViewSet(viewsets.ModelViewSet):
    queryset = Copiloto.objects.all()
    serializer_class = CopilotoSerializer

class SobrecargoViewSet(viewsets.ModelViewSet):
    queryset = Sobrecargo.objects.all()
    serializer_class = SobrecargoSerializer

class AeropuertoViewSet(viewsets.ModelViewSet):
    queryset = Aeropuerto.objects.all()
    serializer_class = AeropuertoSerializer

class TerminalViewSet(viewsets.ModelViewSet):
    queryset = Terminal.objects.all()
    serializer_class = TerminalSerializer

class VueloViewSet(viewsets.ModelViewSet):
    queryset = Vuelo.objects.all()
    serializer_class = VueloSerializer