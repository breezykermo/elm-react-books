import React from 'react'
import ProgressBar from './ProgressBar'
import { deduceUrl } from '../utils'
import { Book as Type_Book, Shelf as Type_Shelf } from '../types'

const DeskDisplay = ({ book }) => {
  const url = deduceUrl(book)
  return (
    <a href={url} className="desk-book" target="_blank">
      <div className="details">
        <div className="title">{book.title}</div>
        <div className="author">{book.author}</div>
      </div>
      <ProgressBar progress={book.progress} />
    </a>
  )
}
DeskDisplay.propTypes = {
  book: Type_Book
}

const Desk = ({ books }) => (
  <div className="container desk-case">
    {books.map((book, id) => (
      <DeskDisplay key={id} book={book} />
    ))}
  </div>
)
Desk.propTypes = {
  books: Type_Shelf
}

export default Desk
