using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace Assessment3.Pages
{
    public class Index1Model : PageModel
    {
        public List<Student> Students = new List<Student>();

        [BindProperty]
        public Student student {  get; set; }
       
        public List<Student> list
        {
            get { return Students; }
        }
        public void OnGet()
        {
        }

        public IActionResult OnPost()
        {
            Students.Add(student);
            return RedirectToAction("Index1");
        }
    }
}
