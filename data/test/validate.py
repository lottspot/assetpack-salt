import unittest
import testinfra

class Test(unittest.TestCase):
  def setUp(self):
    self.host = testinfra.get_host('local://')
  def test_systemd_installed(self):
    systemd = self.host.file('/usr/lib/systemd/systemd')
    self.assertTrue(systemd.exists)
  def test_systemd_configured(self):
    systemd = self.host.file('/etc/systemd/system.conf')
    self.assertTrue(systemd.exists)
  def test_systemd_service(self):
    systemd = self.host.service('systemd-journald')
    self.assertTrue(systemd.is_running)
    self.assertTrue(systemd.is_enabled)

if __name__ == '__main__':
  unittest.main()
