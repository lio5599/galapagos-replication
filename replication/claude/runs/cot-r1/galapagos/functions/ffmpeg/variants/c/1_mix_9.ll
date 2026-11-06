; ModuleID = '/home/liolsen/galapagos-replication/functions/ffmpeg/variants/c/1_mix_9.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/ffmpeg/variants/c/1_mix_9.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i32 @mix(i32 noundef 0, i32 noundef 0)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @mix(i32 noundef %c0, i32 noundef %c1) #0 {
entry:
  %c0.addr = alloca i32, align 4
  %c1.addr = alloca i32, align 4
  %blue = alloca i32, align 4
  %green = alloca i32, align 4
  %red = alloca i32, align 4
  %qr = alloca i32, align 4
  store i32 %c0, ptr %c0.addr, align 4
  store i32 %c1, ptr %c1.addr, align 4
  %0 = load i32, ptr %c0.addr, align 4
  %and = and i32 %0, 31
  %mul = mul nsw i32 2, %and
  %1 = load i32, ptr %c1.addr, align 4
  %and1 = and i32 %1, 31
  %add = add nsw i32 %mul, %and1
  store i32 %add, ptr %blue, align 4
  %2 = load i32, ptr %c0.addr, align 4
  %shr = ashr i32 %2, 5
  %and2 = and i32 %shr, 31
  %mul3 = mul nsw i32 2, %and2
  %3 = load i32, ptr %c1.addr, align 4
  %shr4 = ashr i32 %3, 5
  %and5 = and i32 %shr4, 31
  %add6 = add nsw i32 %mul3, %and5
  store i32 %add6, ptr %green, align 4
  %4 = load i32, ptr %c0.addr, align 4
  %shr7 = ashr i32 %4, 10
  %mul8 = mul nsw i32 2, %shr7
  %5 = load i32, ptr %c1.addr, align 4
  %shr9 = ashr i32 %5, 10
  %add10 = add nsw i32 %mul8, %shr9
  store i32 %add10, ptr %red, align 4
  %6 = load i32, ptr %red, align 4
  %conv = sext i32 %6 to i64
  %mul11 = mul nsw i64 %conv, 1431655766
  %shr12 = ashr i64 %mul11, 32
  %conv13 = trunc i64 %shr12 to i32
  %7 = load i32, ptr %red, align 4
  %cmp = icmp slt i32 %7, 0
  %conv14 = zext i1 %cmp to i32
  %add15 = add nsw i32 %conv13, %conv14
  store i32 %add15, ptr %qr, align 4
  %8 = load i32, ptr %qr, align 4
  %mul16 = mul nsw i32 %8, 1024
  %9 = load i32, ptr %green, align 4
  %mul17 = mul nsw i32 %9, 171
  %shr18 = ashr i32 %mul17, 9
  %mul19 = mul nsw i32 %shr18, 32
  %add20 = add nsw i32 %mul16, %mul19
  %10 = load i32, ptr %blue, align 4
  %mul21 = mul nsw i32 %10, 171
  %shr22 = ashr i32 %mul21, 9
  %add23 = add nsw i32 %add20, %shr22
  ret i32 %add23
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 17.0.0 (git@github.com:llvm/llvm-project.git 1a7a00bdc99fa2b2ca19ecd2d1069991b3c1006b)"}
