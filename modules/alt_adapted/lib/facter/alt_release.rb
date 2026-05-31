Facter.add(:alt_release) do
  confine kernel: 'Linux'

  setcode do
    release_file = '/etc/altlinux-release'

    begin
      if File.file?(release_file) && File.readable?(release_file)
        File.read(release_file).strip
      else
        'not_alt_linux'
      end
    rescue StandardError => e
      "error: #{e.class}"
    end
  end
end
