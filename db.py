from pathlib import Path

import duckdb

DATA_DIR = Path(__file__).parent / "data"


def connect():
    """Open DuckDB with one view per Parquet file, so SQL can say FROM orders."""
    con = duckdb.connect()
    for file in sorted(DATA_DIR.glob("*.parquet")):
        con.execute(f"CREATE VIEW {file.stem} AS SELECT * FROM '{file.as_posix()}'")
    return con
