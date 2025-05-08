import pytest
from app import create_app

@pytest.fixture
def app():
    app = create_app()
    app.config.update({
        "TESTING": True,
    })
    yield app

@pytest.fixture
def client(app):
    return app.test_client()

def test_home_ok(client):
    response = client.get("/")
    assert response.status_code == 200
    assert b"AleroPreco" in response.data

def test_dashboard_ok(client):
    response = client.get("/dashboard/")
    assert response.status_code == 200

def test_404(client):
    response = client.get("/naoexiste")
    assert response.status_code == 404
    assert "Página não encontrada" in response.data.decode("utf-8")
