import React from 'react'
import { deduceUrl } from '../utils'
import { Book as Type_Book, Shelf as Type_Shelf } from '../types'

const ShelfDisplay = ({ book }) => {
  const url = deduceUrl(book)
  return (
    <a href={url} className="shelf-book" target="_blank">
      <div className="author">{book.author}</div>
      <div className="title">{book.title}</div>
    </a>
  )
}
ShelfDisplay.propTypes = {
  book: Type_Book
};

const Shelf = ({ books }) => (
  <div className="container shelf-case">
    {books.map((book, id) => (
      <ShelfDisplay key={id} book={book} />
    ))}
  </div>
)
Shelf.propTypes = {
  books: Type_Shelf
};

export default Shelf


