; ModuleID = '/home/liolsen/galapagos-replication/functions/libgcrypt/variants/c/1_ctz_7.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/libgcrypt/variants/c/1_ctz_7.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @ctz(i64 noundef %in) #0 {
entry:
  %in.addr = alloca i64, align 8
  %y = alloca i64, align 8
  %r = alloca i32, align 4
  store i64 %in, ptr %in.addr, align 8
  %0 = load i64, ptr %in.addr, align 8
  %1 = load i64, ptr %in.addr, align 8
  %not = xor i64 %1, -1
  %add = add i64 %not, 1
  %and = and i64 %0, %add
  store i64 %and, ptr %y, align 8
  store i32 0, ptr %r, align 4
  %2 = load i64, ptr %y, align 8
  %and1 = and i64 %2, -6148914691236517206
  %cmp = icmp ne i64 %and1, 0
  %conv = zext i1 %cmp to i32
  %3 = load i32, ptr %r, align 4
  %or = or i32 %3, %conv
  store i32 %or, ptr %r, align 4
  %4 = load i64, ptr %y, align 8
  %and2 = and i64 %4, -3689348814741910324
  %cmp3 = icmp ne i64 %and2, 0
  %conv4 = zext i1 %cmp3 to i32
  %shl = shl i32 %conv4, 1
  %5 = load i32, ptr %r, align 4
  %or5 = or i32 %5, %shl
  store i32 %or5, ptr %r, align 4
  %6 = load i64, ptr %y, align 8
  %and6 = and i64 %6, -1085102592571150096
  %cmp7 = icmp ne i64 %and6, 0
  %conv8 = zext i1 %cmp7 to i32
  %shl9 = shl i32 %conv8, 2
  %7 = load i32, ptr %r, align 4
  %or10 = or i32 %7, %shl9
  store i32 %or10, ptr %r, align 4
  %8 = load i64, ptr %y, align 8
  %and11 = and i64 %8, -71777214294589696
  %cmp12 = icmp ne i64 %and11, 0
  %conv13 = zext i1 %cmp12 to i32
  %shl14 = shl i32 %conv13, 3
  %9 = load i32, ptr %r, align 4
  %or15 = or i32 %9, %shl14
  store i32 %or15, ptr %r, align 4
  %10 = load i64, ptr %y, align 8
  %and16 = and i64 %10, -281470681808896
  %cmp17 = icmp ne i64 %and16, 0
  %conv18 = zext i1 %cmp17 to i32
  %shl19 = shl i32 %conv18, 4
  %11 = load i32, ptr %r, align 4
  %or20 = or i32 %11, %shl19
  store i32 %or20, ptr %r, align 4
  %12 = load i64, ptr %y, align 8
  %and21 = and i64 %12, -4294967296
  %cmp22 = icmp ne i64 %and21, 0
  %conv23 = zext i1 %cmp22 to i32
  %shl24 = shl i32 %conv23, 5
  %13 = load i32, ptr %r, align 4
  %or25 = or i32 %13, %shl24
  store i32 %or25, ptr %r, align 4
  %14 = load i64, ptr %in.addr, align 8
  %cmp26 = icmp eq i64 %14, 0
  %conv27 = zext i1 %cmp26 to i32
  %shl28 = shl i32 %conv27, 6
  %15 = load i32, ptr %r, align 4
  %or29 = or i32 %15, %shl28
  store i32 %or29, ptr %r, align 4
  %16 = load i32, ptr %r, align 4
  ret i32 %16
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i32 @ctz(i64 noundef 0)
  ret i32 0
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
