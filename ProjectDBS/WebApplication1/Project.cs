//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace WebApplication1
{
    using System;
    using System.Collections.Generic;
    
    public partial class Project
    {
        public Project()
        {
            this.Contracts = new HashSet<Contract>();
        }
    
        public int Project_id { get; set; }
        public Nullable<int> Company_id { get; set; }
        public string Project_name { get; set; }
    
        public virtual Company Company { get; set; }
        public virtual ICollection<Contract> Contracts { get; set; }
    }
}
