module Public::NotificationsHelper
# rubocop:disable all
  def notification_form(notification)
    @owner = notification.owner
    case notification.category
      when "coupon_notice" then
        tag.a(@owner.name, href: owner_path(@owner)) + "から" + tag.a("クーポン", href: coupons_path) + "が届きました"
      when "information_notice" then
        tag.a(@owner.name, href: owner_path(@owner)) + "が" +
        tag.a("テイクアウト営業情報", href: owner_informations_owner_path(@owner.id)) + "を投稿しました"
    end
  end

  def unchecked_notifications
    @notifications = current_customer.notifications.where(is_checked: false)
  end
end
# rubocop:enable all