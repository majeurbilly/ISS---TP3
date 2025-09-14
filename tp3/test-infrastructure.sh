#!/bin/bash

# Script de test pour l'infrastructure TP3
# Usage: ./test-infrastructure.sh [start|stop|logs|test|clean]

set -e

COMPOSE_FILE="docker-compose.yml"

# Couleurs pour les messages
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Fonction pour afficher les messages colorés
print_message() {
    echo -e "${2}${1}${NC}"
}

# Fonction d'aide
show_help() {
    echo "Usage: $0 [COMMAND]"
    echo ""
    echo "Commands:"
    echo "  start   - Démarrer l'infrastructure"
    echo "  stop    - Arrêter l'infrastructure"
    echo "  logs    - Afficher les logs"
    echo "  test    - Tester le load balancing"
    echo "  clean   - Nettoyer complètement (arrêt + suppression volumes)"
    echo "  status  - Afficher le statut des conteneurs"
    echo "  health  - Vérifier la santé des services"
    echo ""
}

# Démarrer l'infrastructure
start_infrastructure() {
    print_message "🚀 Démarrage de l'infrastructure TP3..." $BLUE
    docker-compose -f $COMPOSE_FILE up -d
    print_message "✅ Infrastructure démarrée avec succès!" $GREEN
    print_message "🌐 Accédez à http://localhost pour tester" $YELLOW
}

# Arrêter l'infrastructure
stop_infrastructure() {
    print_message "🛑 Arrêt de l'infrastructure TP3..." $BLUE
    docker-compose -f $COMPOSE_FILE down
    print_message "✅ Infrastructure arrêtée!" $GREEN
}

# Afficher les logs
show_logs() {
    print_message "📋 Affichage des logs..." $BLUE
    docker-compose -f $COMPOSE_FILE logs -f
}

# Tester le load balancing
test_load_balancing() {
    print_message "🧪 Test du load balancing..." $BLUE
    
    if ! command -v curl &> /dev/null; then
        print_message "❌ curl n'est pas installé. Veuillez installer curl pour effectuer les tests." $RED
        return 1
    fi
    
    print_message "Test de 10 requêtes pour vérifier l'équilibrage de charge:" $YELLOW
    
    for i in {1..10}; do
        echo -n "Requête $i: "
        response=$(curl -s http://localhost | grep -o "Serveur [12]" | head -1)
        echo "$response"
        sleep 1
    done
    
    print_message "✅ Test terminé!" $GREEN
}

# Nettoyer complètement
clean_infrastructure() {
    print_message "🧹 Nettoyage complet de l'infrastructure..." $BLUE
    docker-compose -f $COMPOSE_FILE down -v
    docker system prune -f
    print_message "✅ Nettoyage terminé!" $GREEN
}

# Afficher le statut
show_status() {
    print_message "📊 Statut des conteneurs:" $BLUE
    docker-compose -f $COMPOSE_FILE ps
}

# Vérifier la santé des services
check_health() {
    print_message "🏥 Vérification de la santé des services..." $BLUE
    
    # Vérifier Nginx
    if curl -s http://localhost/health > /dev/null; then
        print_message "✅ Nginx: OK" $GREEN
    else
        print_message "❌ Nginx: ERREUR" $RED
    fi
    
    # Vérifier les conteneurs
    if docker-compose -f $COMPOSE_FILE ps | grep -q "Up"; then
        print_message "✅ Conteneurs: OK" $GREEN
    else
        print_message "❌ Conteneurs: ERREUR" $RED
    fi
}

# Script principal
case "${1:-}" in
    start)
        start_infrastructure
        ;;
    stop)
        stop_infrastructure
        ;;
    logs)
        show_logs
        ;;
    test)
        test_load_balancing
        ;;
    clean)
        clean_infrastructure
        ;;
    status)
        show_status
        ;;
    health)
        check_health
        ;;
    *)
        show_help
        ;;
esac
