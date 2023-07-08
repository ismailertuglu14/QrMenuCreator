class PageDurations extends Duration {
  const PageDurations.min() : super(milliseconds: 150);

  const PageDurations.low() : super(milliseconds: 300);
  const PageDurations.normal() : super(milliseconds: 500);
  const PageDurations.medium() : super(milliseconds: 1);
  const PageDurations.height() : super(seconds: 1200);
  const PageDurations.max() : super(seconds: 3);
}
