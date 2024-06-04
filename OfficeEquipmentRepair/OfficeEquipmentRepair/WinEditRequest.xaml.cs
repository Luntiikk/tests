using OfficeEquipmentRepair.DB;
using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
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
    /// Логика взаимодействия для WinEditRequest.xaml
    /// </summary>
    public partial class WinEditRequest : Window
    {
        int identity;
        DB.Request requests;
        public WinEditRequest(int idUser, DB.Request request)
        {
            InitializeComponent();
            identity = idUser;
            requests = request;
            this.DataContext = request;
            cmbProblem.ItemsSource = App.demEntities.Problems.Select(c=>c.problemDescryption).ToList();
            cmbTypeTech.ItemsSource = App.demEntities.TypeTechs.Select(c=>c.orgTechType).ToList();

            List<Request> requests1 = App.demEntities.Requests.Where(c=>c.requestID == requests.requestID).ToList();
            tbModel.Text = requests1[0].orgTechModel.ToString();

            List<TypeTech> typeTeches = App.demEntities.TypeTechs.Where(c=>c.idType == requests.idTechType).ToList();
            cmbTypeTech.Text = typeTeches[0].orgTechType.ToString();

            List<Problem> problems = App.demEntities.Problems.Where(c=>c.idProblem == requests.idProblem).ToList();
            cmbProblem.Text = problems[0].problemDescryption.ToString();
        }
        /// <summary>
        /// редактирование заявки
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btSave_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                int editProblem = App.demEntities.Problems.Where(c => c.problemDescryption == cmbProblem.Text).Select(c => c.idProblem).FirstOrDefault();//получение id проблемы
                int editTypeTech = App.demEntities.TypeTechs.Where(c => c.orgTechType == cmbTypeTech.Text).Select(c => c.idType).FirstOrDefault();
                List<Request> requests1 = App.demEntities.Requests.Where(c => c.requestID == requests.requestID).ToList();
                requests1[0].idProblem = editProblem;
                requests1[0].idTechType = editTypeTech;
                requests1[0].orgTechModel = tbModel.Text;
                App.demEntities.Requests.AddOrUpdate();//обновление данных
                App.demEntities.SaveChanges();
                MessageBox.Show("Данные успешно обновлены", "Уведомление", MessageBoxButton.OK, MessageBoxImage.Information);
                this.Close();
            }
            catch { }
        }

        private void btExit_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
           
        }
    }
}
