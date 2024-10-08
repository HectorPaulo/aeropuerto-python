from django.urls import include, path
from rest_framework.routers import DefaultRouter
from aeropuerto.api.views import (
    VehiculoAereoViewSet, AvionViewSet, AvionetaViewSet, HelicopteroViewSet,
    PersonaViewSet, PasajeroViewSet, TripulacionViewSet, PilotoViewSet,
    CopilotoViewSet, SobrecargoViewSet, AeropuertoViewSet, TerminalViewSet, VueloViewSet
)

router = DefaultRouter()
router.register(r'vehiculo-aereo', VehiculoAereoViewSet, basename='vehiculo-aereo')
router.register(r'avion', AvionViewSet, basename='avion')
router.register(r'avioneta', AvionetaViewSet, basename='avioneta')
router.register(r'helicoptero', HelicopteroViewSet, basename='helicoptero')
router.register(r'persona', PersonaViewSet, basename='persona')
router.register(r'pasajero', PasajeroViewSet, basename='pasajero')
router.register(r'tripulacion', TripulacionViewSet, basename='tripulacion')
router.register(r'piloto', PilotoViewSet, basename='piloto')
router.register(r'copiloto', CopilotoViewSet, basename='copiloto')
router.register(r'sobrecargo', SobrecargoViewSet, basename='sobrecargo')
router.register(r'aeropuerto', AeropuertoViewSet, basename='aeropuerto')
router.register(r'terminal', TerminalViewSet, basename='terminal')
router.register(r'vuelo', VueloViewSet, basename='vuelo')

urlpatterns = [path('', include(router.urls)),]