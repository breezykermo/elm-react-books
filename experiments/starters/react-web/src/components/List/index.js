import React, { PropTypes } from 'react'
import './List.css'

class List extends React.Component {
  static propTypes = {
    title: PropTypes.string,
    items: PropTypes.array.isRequired,
  };
  static defaultProps = {
    items: []
  };

  render() {
    const { title, items } = this.props;
    return (
      <div className="list-container">
      {title && (
        <h4 className="list-title">{title}</h4>    
      )}
      {(items.length > 0) && (
        <ul>
        {items.map((item, index) => (
          <li key={index}>{item}</li>
        ))}
        </ul>
      )}
      </div>
    )
  }
}

export default List
