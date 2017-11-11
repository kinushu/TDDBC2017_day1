
class VersionError < StandardError
end

class Version
  SEPARATOR = '.'.freeze

  def initialize(major, minor, patch)
    check_params(major, 'majorが不正です。')
    check_params(minor, 'minorが不正です。')
    check_params(patch, 'patchが不正です。')
    @major = major
    @minor = minor
    @patch = patch
  end

  def to_s
    "#{@major}#{SEPARATOR}#{@minor}#{SEPARATOR}#{@patch}"
  end

  def ==(other)
    (other.to_s == self.to_s)
  end

  def version_up!(type)
    case type
      when :patch
        @patch += 1
      when :minor
    end

  end

  private

  def check_params(param, message)
    raise VersionError.new(message) if !param.kind_of?(Integer) || 0 > param
  end
end