; ModuleID = '/home/liolsen/galapagos-replication/functions/libgcrypt/variants/c/1_ctz_6.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/libgcrypt/variants/c/1_ctz_6.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @ctz(i64 noundef %in) #0 {
entry:
  %in.addr = alloca i64, align 8
  %r = alloca i32, align 4
  %t = alloca i32, align 4
  store i64 %in, ptr %in.addr, align 8
  store i32 0, ptr %r, align 4
  %0 = load i64, ptr %in.addr, align 8
  %and = and i64 %0, 4294967295
  %cmp = icmp eq i64 %and, 0
  %conv = zext i1 %cmp to i32
  %shl = shl i32 %conv, 5
  store i32 %shl, ptr %t, align 4
  %1 = load i32, ptr %t, align 4
  %2 = load i32, ptr %r, align 4
  %add = add nsw i32 %2, %1
  store i32 %add, ptr %r, align 4
  %3 = load i32, ptr %t, align 4
  %4 = load i64, ptr %in.addr, align 8
  %sh_prom = zext i32 %3 to i64
  %shr = lshr i64 %4, %sh_prom
  store i64 %shr, ptr %in.addr, align 8
  %5 = load i64, ptr %in.addr, align 8
  %and1 = and i64 %5, 65535
  %cmp2 = icmp eq i64 %and1, 0
  %conv3 = zext i1 %cmp2 to i32
  %shl4 = shl i32 %conv3, 4
  store i32 %shl4, ptr %t, align 4
  %6 = load i32, ptr %t, align 4
  %7 = load i32, ptr %r, align 4
  %add5 = add nsw i32 %7, %6
  store i32 %add5, ptr %r, align 4
  %8 = load i32, ptr %t, align 4
  %9 = load i64, ptr %in.addr, align 8
  %sh_prom6 = zext i32 %8 to i64
  %shr7 = lshr i64 %9, %sh_prom6
  store i64 %shr7, ptr %in.addr, align 8
  %10 = load i64, ptr %in.addr, align 8
  %and8 = and i64 %10, 255
  %cmp9 = icmp eq i64 %and8, 0
  %conv10 = zext i1 %cmp9 to i32
  %shl11 = shl i32 %conv10, 3
  store i32 %shl11, ptr %t, align 4
  %11 = load i32, ptr %t, align 4
  %12 = load i32, ptr %r, align 4
  %add12 = add nsw i32 %12, %11
  store i32 %add12, ptr %r, align 4
  %13 = load i32, ptr %t, align 4
  %14 = load i64, ptr %in.addr, align 8
  %sh_prom13 = zext i32 %13 to i64
  %shr14 = lshr i64 %14, %sh_prom13
  store i64 %shr14, ptr %in.addr, align 8
  %15 = load i64, ptr %in.addr, align 8
  %and15 = and i64 %15, 15
  %cmp16 = icmp eq i64 %and15, 0
  %conv17 = zext i1 %cmp16 to i32
  %shl18 = shl i32 %conv17, 2
  store i32 %shl18, ptr %t, align 4
  %16 = load i32, ptr %t, align 4
  %17 = load i32, ptr %r, align 4
  %add19 = add nsw i32 %17, %16
  store i32 %add19, ptr %r, align 4
  %18 = load i32, ptr %t, align 4
  %19 = load i64, ptr %in.addr, align 8
  %sh_prom20 = zext i32 %18 to i64
  %shr21 = lshr i64 %19, %sh_prom20
  store i64 %shr21, ptr %in.addr, align 8
  %20 = load i64, ptr %in.addr, align 8
  %and22 = and i64 %20, 3
  %cmp23 = icmp eq i64 %and22, 0
  %conv24 = zext i1 %cmp23 to i32
  %shl25 = shl i32 %conv24, 1
  store i32 %shl25, ptr %t, align 4
  %21 = load i32, ptr %t, align 4
  %22 = load i32, ptr %r, align 4
  %add26 = add nsw i32 %22, %21
  store i32 %add26, ptr %r, align 4
  %23 = load i32, ptr %t, align 4
  %24 = load i64, ptr %in.addr, align 8
  %sh_prom27 = zext i32 %23 to i64
  %shr28 = lshr i64 %24, %sh_prom27
  store i64 %shr28, ptr %in.addr, align 8
  %25 = load i64, ptr %in.addr, align 8
  %and29 = and i64 %25, 1
  %cmp30 = icmp eq i64 %and29, 0
  %conv31 = zext i1 %cmp30 to i32
  store i32 %conv31, ptr %t, align 4
  %26 = load i32, ptr %t, align 4
  %27 = load i32, ptr %r, align 4
  %add32 = add nsw i32 %27, %26
  store i32 %add32, ptr %r, align 4
  %28 = load i32, ptr %t, align 4
  %29 = load i64, ptr %in.addr, align 8
  %sh_prom33 = zext i32 %28 to i64
  %shr34 = lshr i64 %29, %sh_prom33
  store i64 %shr34, ptr %in.addr, align 8
  %30 = load i64, ptr %in.addr, align 8
  %and35 = and i64 %30, 1
  %xor = xor i64 %and35, 1
  %conv36 = trunc i64 %xor to i32
  %31 = load i32, ptr %r, align 4
  %add37 = add nsw i32 %31, %conv36
  store i32 %add37, ptr %r, align 4
  %32 = load i32, ptr %r, align 4
  ret i32 %32
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
