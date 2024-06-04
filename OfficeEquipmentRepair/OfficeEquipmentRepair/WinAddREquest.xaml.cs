using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace OfficeEquipmentRepair
{
    /// <summary>
    /// Логика взаимодействия для WinAddREquest.xaml
    /// </summary>
    public partial class WinAddREquest : Window
    {
        int identity;
        public WinAddREquest(int id)
        {
            InitializeComponent();
            identity = id;
            cmbProblem.ItemsSource = App.demEntities.Problems.Select(c => c.problemDescryption).ToList();
            cmbTypeTech.ItemsSource = App.demEntities.TypeTechs.Select(c => c.orgTechType).ToList();
        }

        private void btSave_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                int editProblem = App.demEntities.Problems.Where(c => c.problemDescryption == cmbProblem.Text).Select(c => c.idProblem).FirstOrDefault();
                int editTypeTech = App.demEntities.TypeTechs.Where(c => c.orgTechType == cmbTypeTech.Text).Select(c => c.idType).FirstOrDefault();
                DB.Request addRequest = new DB.Request
                {
                    startDate = DateTime.Now,
                    idProblem = editProblem,
                    idTechType = editTypeTech,
                    idStatus = 3,
                    clientID = identity,
                    orgTechModel = tbModel.Text
                };
                App.demEntities.Requests.Add(addRequest);
                App.demEntities.SaveChanges();
                MessageBox.Show("Заявка успешно принята", "Уведомление", MessageBoxButton.OK, MessageBoxImage.Information);
                this.Close();
            }
            catch { }
        }

        private void btExit_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }
    }
}
