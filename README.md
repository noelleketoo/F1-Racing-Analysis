# F1 Racing Analysis

ML project predicting F1 race outcomes by analyzing factors like qualifying position, circuit characteristics, driver history, and constructor performance. Includes data preprocessing, EDA, and baseline models.

---

## Quick Start

```bash
# One-time setup
make setup

# Start Jupyter Notebook
make start

# Check status
make status
```

---

## Commands

| Command | Description |
|---------|-------------|
| `make setup` | Build Docker image (one-time) |
| `make start` | Start Jupyter Notebook |
| `make stop` | Stop all containers |
| `make status` | Show environment status |
| `make logs` | View container logs |
| `make clean` | Remove containers and images |

---

## Structure

```
F1-Racing-Analysis/
├── bin/                   # CLI scripts
│   ├── setup.sh           # Build Docker image
│   ├── start.sh           # Start Jupyter
│   ├── stop.sh            # Stop containers
│   ├── status.sh          # Show status
│   ├── logs.sh            # View logs
│   └── cleanup.sh         # Clean up
├── lib/                   # Shared utilities
│   └── utils.sh           # Terminal formatting
├── docker/                # Docker configuration
│   ├── Dockerfile         # Container definition
│   └── requirements.txt   # Python dependencies
├── datasets/              # CSV data files (14 files)
├── analysis.ipynb         # Main Jupyter notebook
├── docker-compose.yml     # Service configuration
├── Makefile               # Command interface
└── README.md
```

---

## Prerequisites

- Docker (20.10+)
- Docker Compose (2.0+)

Verify installation:
```bash
docker --version
docker compose version
```

---

## Team

- Noelle Keto
- Anders Aistars
- Xavier Agostino
- Sonny Wang
- Mert Iravul

---

## Project Goals

Predict race outcomes (points scored and final position) using ML models. Key factors:

- Qualifying position
- Pit stop timing and frequency
- Weather conditions
- Driver performance history
- Constructor/team performance
- Circuit characteristics
- Lap times and race pace

---

## Dataset Overview

Kaggle dataset with F1 data from 1950-2024.

- 14 CSV files
- 120 columns total
- Key identifiers: raceId, driverId, constructorId, circuitId

### Dataset Files

All files are in `datasets/`:

**Core Race Data**:
- `results.csv` (26,759 rows) - race results, points, final positions
- `races.csv` (1,125 rows) - race info, dates, circuits, seasons
- `qualifying.csv` - qualifying results and starting grid positions

**Driver and Team Data**:
- `drivers.csv` (861 rows) - driver info
- `driver_standings.csv` - driver championship standings
- `constructors.csv` (212 rows) - constructor/team info
- `constructor_standings.csv` - constructor standings
- `constructor_results.csv` - constructor race results

**Race Details**:
- `circuits.csv` (77 rows) - circuit info and characteristics
- `lap_times.csv` - detailed lap time data
- `pit_stops.csv` - pit stop timing and duration
- `sprint_results.csv` - sprint race results (recent seasons)

**Supporting Data**:
- `seasons.csv` - season info
- `status.csv` - status codes (DNF, DSQ, etc.)

---

## Dependencies

- pandas >= 2.0.0
- numpy >= 1.24.0
- matplotlib >= 3.7.0
- seaborn >= 0.12.0
- scikit-learn >= 1.3.0
- jupyter >= 1.0.0
- notebook >= 7.0.0
- ipykernel >= 6.25.0

Dependencies install automatically when building the Docker image.

---

## Troubleshooting

| Problem | Solution |
|---------|----------|
| Docker not running | Start Docker Desktop |
| Port 8888 in use | `make stop` or change port in `docker-compose.yml` |
| Permission denied | `chmod +x bin/*.sh lib/*.sh` |
| Container won't start | `make logs` to see errors |
| Image not found | `make setup` to build |

---

## Development

**Access container shell**:
```bash
docker compose exec jupyter /bin/bash
```

**Rebuild after dependency changes**:
```bash
make clean
make setup
make start
```

**Working with notebook**:
- Open `analysis.ipynb` in Jupyter
- Changes auto-save to local filesystem
- Use Git to track changes

---

## Team Collaboration

**Git workflow**:
- Create feature branches for new work
- Commit frequently with clear messages
- Pull before pushing
- Review before merging

**Notebook practices**:
- Document code with markdown
- Use descriptive variable names
- Save outputs for important steps
- Keep organized sections

**Data handling**:
- Don't commit large processed datasets
- Document transformations in notebook
- Keep original datasets unchanged

---

## Cleanup

Remove everything:
```bash
make clean
```

Or manually:
```bash
docker compose down -v
docker rmi f1-racing-analysis-jupyter
```
