from backend.db.data_models import Assets, Jobs, Pages, PagesAssetsRel, Photobooks
from backend.db.schemas import (
    AssetsCreate,
    AssetsUpdate,
    JobsCreate,
    JobsUpdate,
    PagesAssetsRelCreate,
    PagesAssetsRelUpdate,
    PagesCreate,
    PagesUpdate,
    PhotobooksCreate,
    PhotobooksUpdate,
)

from .base import AsyncPostgreSQLDAL, FilterOp, InvalidFilterFieldError, OrderDirection


class AssetsDAL(AsyncPostgreSQLDAL[Assets, AssetsCreate, AssetsUpdate]):
    model = Assets


class JobsDAL(AsyncPostgreSQLDAL[Jobs, JobsCreate, JobsUpdate]):
    model = Jobs


class PagesDAL(AsyncPostgreSQLDAL[Pages, PagesCreate, PagesUpdate]):
    model = Pages


class PagesAssetsRelDAL(
    AsyncPostgreSQLDAL[PagesAssetsRel, PagesAssetsRelCreate, PagesAssetsRelUpdate]
):
    model = PagesAssetsRel


class PhotobooksDAL(AsyncPostgreSQLDAL[Photobooks, PhotobooksCreate, PhotobooksUpdate]):
    model = Photobooks


__all__ = [
    # DALs
    "AssetsDAL",
    "JobsDAL",
    "PagesDAL",
    "PagesAssetsRelDAL",
    "PhotobooksDAL",
    # DAL base
    "AsyncPostgreSQLDAL",
    "FilterOp",
    "InvalidFilterFieldError",
    "OrderDirection",
    # ORM objects
    "Assets",
    "Jobs",
    "Pages",
    "PagesAssetsRel",
    "Photobooks",
    # Schemas
    "AssetsCreate",
    "AssetsUpdate",
    "JobsCreate",
    "JobsUpdate",
    "PagesCreate",
    "PagesUpdate",
    "PagesAssetsRelCreate",
    "PagesAssetsRelUpdate",
    "PhotobooksCreate",
    "PhotobooksUpdate",
]
