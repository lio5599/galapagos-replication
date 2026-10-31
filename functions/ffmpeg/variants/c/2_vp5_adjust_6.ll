; ModuleID = '/home/liolsen/galapagos-replication/functions/ffmpeg/variants/c/2_vp5_adjust_6.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/ffmpeg/variants/c/2_vp5_adjust_6.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i32 @vp5_adjust(i32 noundef 0, i32 noundef 0)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @vp5_adjust(i32 noundef %v, i32 noundef %t) #0 {
entry:
  %v.addr = alloca i32, align 4
  %t.addr = alloca i32, align 4
  %s = alloca i32, align 4
  %a = alloca i32, align 4
  %keep = alloca i32, align 4
  %d = alloca i32, align 4
  %m = alloca i32, align 4
  store i32 %v, ptr %v.addr, align 4
  store i32 %t, ptr %t.addr, align 4
  %0 = load i32, ptr %v.addr, align 4
  %cmp = icmp slt i32 %0, 0
  %conv = zext i1 %cmp to i32
  %sub = sub nsw i32 0, %conv
  store i32 %sub, ptr %s, align 4
  %1 = load i32, ptr %v.addr, align 4
  %2 = load i32, ptr %s, align 4
  %xor = xor i32 %1, %2
  %3 = load i32, ptr %s, align 4
  %sub1 = sub nsw i32 %xor, %3
  store i32 %sub1, ptr %a, align 4
  %4 = load i32, ptr %a, align 4
  %5 = load i32, ptr %t.addr, align 4
  %mul = mul nsw i32 2, %5
  %cmp2 = icmp slt i32 %4, %mul
  %conv3 = zext i1 %cmp2 to i32
  %sub4 = sub nsw i32 0, %conv3
  store i32 %sub4, ptr %keep, align 4
  %6 = load i32, ptr %keep, align 4
  %7 = load i32, ptr %a, align 4
  %and = and i32 %7, %6
  store i32 %and, ptr %a, align 4
  %8 = load i32, ptr %a, align 4
  %9 = load i32, ptr %t.addr, align 4
  %sub5 = sub nsw i32 %8, %9
  store i32 %sub5, ptr %d, align 4
  %10 = load i32, ptr %d, align 4
  %cmp6 = icmp slt i32 %10, 0
  %conv7 = zext i1 %cmp6 to i32
  %sub8 = sub nsw i32 0, %conv7
  store i32 %sub8, ptr %m, align 4
  %11 = load i32, ptr %d, align 4
  %12 = load i32, ptr %m, align 4
  %xor9 = xor i32 %11, %12
  %13 = load i32, ptr %m, align 4
  %sub10 = sub nsw i32 %xor9, %13
  store i32 %sub10, ptr %d, align 4
  %14 = load i32, ptr %t.addr, align 4
  %15 = load i32, ptr %d, align 4
  %sub11 = sub nsw i32 %14, %15
  store i32 %sub11, ptr %a, align 4
  %16 = load i32, ptr %a, align 4
  %17 = load i32, ptr %s, align 4
  %xor12 = xor i32 %16, %17
  %18 = load i32, ptr %s, align 4
  %sub13 = sub nsw i32 %xor12, %18
  ret i32 %sub13
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
