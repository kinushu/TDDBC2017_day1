require_relative 'version'

describe 'セマンティック・バージョニング' do
  describe '文字列と比較できる' do
    it 'major=1, minor=4, patch=2 であれば "1.4.2" と等しい' do
      expect(Version.new(1, 4, 2)).to eq '1.4.2'
    end

    it 'major=2, minor=1, patch=0 であれば "2.1.0" と等しい' do
      expect(Version.new(2, 1, 0)).to eq '2.1.0'
    end
  end

  describe 'Versionクラス同士で比較できる' do
    it 'バージョン 1.4.2 は バージョン 1.4.2 と等しい' do
      expect(Version.new(1, 4, 2)).to eq Version.new(1, 4, 2)
    end

    it 'バージョン 1.4.2 は バージョン 2.1.0 と等しくない' do
      expect(Version.new(1, 4, 2)).not_to eq Version.new(2, 1, 0)
    end
  end

  describe '不正な引数を設定したとき' do
    describe '負の整数の場合' do
      it 'majorに負の整数を設定すると例外が発生' do
        expect { Version.new(-1, 4, 2) }.to raise_error(VersionError, 'majorが不正です。')
      end

      it 'minorに負の整数を設定すると例外が発生' do
        expect { Version.new(1, -4, 2) }.to raise_error(VersionError, 'minorが不正です。')
      end

      it 'patchに負の整数を設定すると例外が発生' do
        expect { Version.new(1, 4, -2) }.to raise_error(VersionError, 'patchが不正です。')
      end
    end

    describe '整数以外の場合' do
      it 'majorに文字列を設定すると例外が発生' do
        expect { Version.new('1', 4, 2) }.to raise_error(VersionError, 'majorが不正です。')
      end

      it 'minorに文字列を設定すると例外が発生' do
        expect { Version.new(1, '4', 2) }.to raise_error(VersionError, 'minorが不正です。')
      end

      it 'patchに文字列を設定すると例外が発生' do
        expect { Version.new(1, 4, '2') }.to raise_error(VersionError, 'patchが不正です。')
      end

    end
  end

  describe 'バージョンアップ' do
    describe 'パッチバージョンアップ' do
      it 'patch フィールドをインクリメントする' do
        ver = Version.new(1, 4, 2)
        ver.version_up!(:patch)
        expect(ver).to eq Version.new(1, 4, 3)
      end
    end

    describe 'マイナーバージョンアップ' do
      it 'minor フィールドをインクリメント patch フィールドを 0 にする' do
        ver = Version.new(1, 4, 2)
        ver.version_up!(:minor)
        expect(ver).to eq Version.new(1, 5, 0)
      end
    end

  end
end


