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
    /// Логика взаимодействия для WinClient.xaml
    /// </summary>
    public partial class WinClient : Window
    {
        int identity;
        public WinClient(int idUser)
        {
            InitializeComponent();
            identity = idUser;
            dgRequest.ItemsSource = App.demEntities.Requests.Where(c => c.clientID == identity).ToList();
        }

        private void btExit_Click(object sender, RoutedEventArgs e)
        {
            MainWindow mainWindow = new MainWindow();
            mainWindow.Show();
        }

        private void btAdd_Click(object sender, RoutedEventArgs e)
        {
            WinAddREquest winAddREquestv = new WinAddREquest(identity);
            winAddREquestv.ShowDialog();
            dgRequest.ItemsSource = App.demEntities.Requests.Where(c => c.clientID == identity).ToList();
        }

        private void btEdit_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                var editRequest = dgRequest.SelectedItem as DB.Request;
                if(editRequest != null)
                {
                    WinEditRequest winEditRequest = new WinEditRequest(identity, editRequest);
                    winEditRequest.ShowDialog();
                    dgRequest.ItemsSource = App.demEntities.Requests.Where(c => c.clientID == identity).ToList();
                }
                else
                {
                    MessageBox.Show("Вы не выбрали строку для редактирования", "Ошибка редактирования", MessageBoxButton.OK, MessageBoxImage.Stop);
                }
            }
            catch { }
        }
    }
}
