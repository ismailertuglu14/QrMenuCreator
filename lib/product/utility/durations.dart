class PageDurations extends Duration {
  const PageDurations.min() : super(milliseconds: 300);

  const PageDurations.low() : super(milliseconds: 500);
  const PageDurations.normal() : super(seconds: 1);
  const PageDurations.medium() : super(milliseconds: 1200);
  const PageDurations.height() : super(seconds: 3);
  const PageDurations.max() : super(seconds: 3);
}
