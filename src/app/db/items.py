"""Database operations for items."""

from sqlmodel import select
from sqlmodel.ext.asyncio.session import AsyncSession

from app.models.item import Item


async def read_items(session: AsyncSession) -> list[Item]:
    """Read all items from the database."""
    result = await session.exec(select(Item))
    return list(result.all())


async def read_item(session: AsyncSession, item_id: int) -> Item | None:
    """Read a single item by id."""
    return await session.get(Item, item_id)


async def create_item(session: AsyncSession, title: str, description: str) -> Item:
    """Create a new item in the database."""
    item = Item(title=title, description=description)
    session.add(item)
    await session.commit()
    await session.refresh(item)
    return item


async def update_item(
    session: AsyncSession, item_id: int, title: str, description: str
) -> Item | None:
    """Update an existing item in the database."""
    item = await session.get(Item, item_id)
    if item is None:
        return None
    item.title = title
    item.description = description
    session.add(item)
    await session.commit()
    await session.refresh(item)
    return item
