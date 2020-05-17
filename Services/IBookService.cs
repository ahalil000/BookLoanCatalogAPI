using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using BookLoan.Models;
using BookLoan.Data;

namespace BookLoan.Services
{
    public interface IBookService
    {
        Task ApplyPatching(PatchBookViewModel vm);
        Task<List<BookViewModel>> GetBooks();
        Task<List<BookViewModel>> GetBooksFilter(string filter);
        Task<BookLoan.Models.BookViewModel> GetBook(int id);
        Task SaveBook(BookViewModel vm);
        Task<BookViewModel> UpdateBook(int id, BookViewModel vm);
    }
}
