# F1 Racing Analysis

ML project predicting F1 race outcomes by analyzing factors like qualifying position, circuit characteristics, driver history, and constructor performance. Includes data preprocessing, EDA, and baseline models.

## Team

- Noelle Keto
- Anders Aistars
- Xavier Agostino
- Sonny Wang
- Mert

## Project Goals

Predict race outcomes (points scored and final position) using ML models. Key factors we're looking at:

- Qualifying position
- Pit stop timing and frequency
- Weather conditions
- Driver performance history
- Constructor/team performance
- Circuit characteristics
- Lap times and race pace

Success is measured by how accurately we can predict points and final positions.

## Project Milestones

### Milestone 2: Data Preprocessing and Exploration

Currently working on data preprocessing and EDA.

**Objectives**:
- Merge datasets across multiple files
- Create ~6 merged datasets for modeling
- Identify key features and relationships
- Handle data inconsistencies and missing values
- Prepare datasets for ML training

**Challenges**:
- Data spread across 14 files requiring multiple joins
- Inconsistent race coverage across datasets
- Need careful alignment using raceId and driverId

## Dataset Overview

Kaggle dataset with F1 data from 1950-2024.

**Stats**:
- 14 CSV files
- 120 columns total
- Time period: 1950-2024
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

### Data Structure

Datasets link through common identifiers:
- `raceId` - links race-related data
- `driverId` - links driver data (results, standings, lap times)
- `constructorId` - links constructor/team data
- `circuitId` - links circuit info

### Preprocessing Strategy

1. **Data Merging**: Join datasets on raceId and driverId
   - Results × Qualifying
   - Results × Drivers
   - Results × Races × Circuits
   - Results × Constructors × Constructor Standings

2. **Data Cleaning**:
   - Handle missing values (drop rows when needed)
   - Ensure consistent feature scaling
   - Validate alignment across merged datasets

3. **Feature Engineering**:
   - Calculate derived metrics (position gains, averages)
   - Create time-based features
   - Normalize numerical features

4. **Dataset Preparation**:
   - Create ~6 distinct merged datasets
   - Each focuses on different factors
   - Ensure compatibility for ML model input

## Prerequisites

- Docker (20.10+)
- Docker Compose (2.0+)

Verify installation:
```bash
docker --version
docker compose version
```

## Project Structure

```
F1-Racing-Analysis/
├── datasets/              # CSV data files (14 files)
│   ├── circuits.csv
│   ├── constructors.csv
│   ├── drivers.csv
│   ├── races.csv
│   ├── results.csv        # Primary dataset
│   └── ... (other datasets)
├── analysis.ipynb         # Main Jupyter notebook
├── Dockerfile            # Docker config
├── docker-compose.yml    # Docker Compose config
├── requirements.txt     # Python dependencies
├── start.sh             # Startup script
└── README.md
```

## Quick Start

### Using Docker Compose

1. Build and start:
   ```bash
   docker compose up --build
   ```

2. Open browser to `http://localhost:8888`

3. Stop:
   ```bash
   docker compose down
   ```

### Using Docker Directly

1. Build image:
   ```bash
   docker build -t f1-analysis .
   ```

2. Run container:
   ```bash
   docker run -d -p 8888:8888 -v $(pwd):/app --name f1-analysis f1-analysis
   ```

3. Access at `http://localhost:8888`

4. Stop and remove:
   ```bash
   docker stop f1-analysis
   docker rm f1-analysis
   ```

## Development

**Run in background**:
```bash
docker compose up -d
```

**View logs**:
```bash
docker compose logs -f
```

**Access container shell**:
```bash
docker compose exec jupyter /bin/bash
```

**Rebuild after changes**:
```bash
docker compose down
docker compose up --build
```

**Working with notebook**:
- Open `analysis.ipynb` in Jupyter
- Changes auto-save to local filesystem
- Use Git to track changes

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

## Current Features

**Data Preprocessing**:
- Load and inspect all 14 dataset files
- Merge datasets on raceId and driverId
- Create merged datasets (Results × Qualifying, Results × Drivers, etc.)

**Exploratory Data Analysis**:
- Correlation analysis (qualifying vs race positions)
- Average finish position by starting position
- Circuit analysis for position gains
- Statistical summaries and visualizations

## Data Issues

**Coverage**: Not all datasets have complete race coverage. Some files missing data for certain races. Focus on races where data exists.

**Missing Values**: Initial inspection showed minimal missing values, but validation needed. Strategy: drop rows with missing critical values. Document any data loss.

**Feature Scaling**: Mostly consistent across datasets. Some normalization needed for ML models. Consider feature importance when scaling.

## Troubleshooting

**Port 8888 in use**: Change port in `docker-compose.yml`:
```yaml
ports:
  - "8889:8888"
```

**Container won't start**:
1. Check Docker: `docker ps`
2. View logs: `docker compose logs`
3. Rebuild: `docker compose down && docker compose up --build`

**Permission issues**: Rebuild container

**Data loading issues**:
- Verify CSV files in `datasets/` directory
- Check file permissions
- Verify UTF-8 encoding
- Check notebook working directory

## Cleanup

Remove containers, volumes, and images:
```bash
docker compose down -v
docker rmi f1-racing-analysis_jupyter
```

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
- Put processed data in separate directories if needed

## Next Steps

- Implement ML models for race prediction
- Evaluate performance with appropriate metrics
- Compare models and feature combinations
- Document model selection and tuning
- Visualize predictions and feature importance

