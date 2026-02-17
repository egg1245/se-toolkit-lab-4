"""Pydantic models for items."""

from datetime import datetime

from sqlmodel import Field, SQLModel


class Item(SQLModel, table=True):
    """An item in the learning management system."""

    __tablename__ = "items"

    id: int | None = Field(default=None, primary_key=True)
    title: str
    description: str = ""
    created_at: datetime | None = Field(default=None)


class ItemCreate(SQLModel):
    """Schema for creating an item."""

    title: str
    description: str = ""


class ItemUpdate(SQLModel):
    """Schema for updating an item."""

    title: str
    description: str = ""
