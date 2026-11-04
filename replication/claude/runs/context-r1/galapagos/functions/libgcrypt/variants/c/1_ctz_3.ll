; ModuleID = '/home/liolsen/galapagos-replication/functions/libgcrypt/variants/c/1_ctz_3.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/libgcrypt/variants/c/1_ctz_3.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @ctz(i64 noundef %in) #0 {
entry:
  %in.addr = alloca i64, align 8
  %r = alloca i32, align 4
  %s = alloca i32, align 4
  %x = alloca i64, align 8
  store i64 %in, ptr %in.addr, align 8
  store i32 0, ptr %r, align 4
  %0 = load i64, ptr %in.addr, align 8
  store i64 %0, ptr %x, align 8
  %1 = load i64, ptr %x, align 8
  %and = and i64 %1, 4294967295
  %cmp = icmp eq i64 %and, 0
  %conv = zext i1 %cmp to i32
  %shl = shl i32 %conv, 5
  store i32 %shl, ptr %s, align 4
  %2 = load i32, ptr %s, align 4
  %3 = load i64, ptr %x, align 8
  %sh_prom = zext i32 %2 to i64
  %shr = lshr i64 %3, %sh_prom
  store i64 %shr, ptr %x, align 8
  %4 = load i32, ptr %s, align 4
  %5 = load i32, ptr %r, align 4
  %add = add nsw i32 %5, %4
  store i32 %add, ptr %r, align 4
  %6 = load i64, ptr %x, align 8
  %and1 = and i64 %6, 65535
  %cmp2 = icmp eq i64 %and1, 0
  %conv3 = zext i1 %cmp2 to i32
  %shl4 = shl i32 %conv3, 4
  store i32 %shl4, ptr %s, align 4
  %7 = load i32, ptr %s, align 4
  %8 = load i64, ptr %x, align 8
  %sh_prom5 = zext i32 %7 to i64
  %shr6 = lshr i64 %8, %sh_prom5
  store i64 %shr6, ptr %x, align 8
  %9 = load i32, ptr %s, align 4
  %10 = load i32, ptr %r, align 4
  %add7 = add nsw i32 %10, %9
  store i32 %add7, ptr %r, align 4
  %11 = load i64, ptr %x, align 8
  %and8 = and i64 %11, 255
  %cmp9 = icmp eq i64 %and8, 0
  %conv10 = zext i1 %cmp9 to i32
  %shl11 = shl i32 %conv10, 3
  store i32 %shl11, ptr %s, align 4
  %12 = load i32, ptr %s, align 4
  %13 = load i64, ptr %x, align 8
  %sh_prom12 = zext i32 %12 to i64
  %shr13 = lshr i64 %13, %sh_prom12
  store i64 %shr13, ptr %x, align 8
  %14 = load i32, ptr %s, align 4
  %15 = load i32, ptr %r, align 4
  %add14 = add nsw i32 %15, %14
  store i32 %add14, ptr %r, align 4
  %16 = load i64, ptr %x, align 8
  %and15 = and i64 %16, 15
  %cmp16 = icmp eq i64 %and15, 0
  %conv17 = zext i1 %cmp16 to i32
  %shl18 = shl i32 %conv17, 2
  store i32 %shl18, ptr %s, align 4
  %17 = load i32, ptr %s, align 4
  %18 = load i64, ptr %x, align 8
  %sh_prom19 = zext i32 %17 to i64
  %shr20 = lshr i64 %18, %sh_prom19
  store i64 %shr20, ptr %x, align 8
  %19 = load i32, ptr %s, align 4
  %20 = load i32, ptr %r, align 4
  %add21 = add nsw i32 %20, %19
  store i32 %add21, ptr %r, align 4
  %21 = load i64, ptr %x, align 8
  %and22 = and i64 %21, 3
  %cmp23 = icmp eq i64 %and22, 0
  %conv24 = zext i1 %cmp23 to i32
  %shl25 = shl i32 %conv24, 1
  store i32 %shl25, ptr %s, align 4
  %22 = load i32, ptr %s, align 4
  %23 = load i64, ptr %x, align 8
  %sh_prom26 = zext i32 %22 to i64
  %shr27 = lshr i64 %23, %sh_prom26
  store i64 %shr27, ptr %x, align 8
  %24 = load i32, ptr %s, align 4
  %25 = load i32, ptr %r, align 4
  %add28 = add nsw i32 %25, %24
  store i32 %add28, ptr %r, align 4
  %26 = load i64, ptr %x, align 8
  %and29 = and i64 %26, 1
  %cmp30 = icmp eq i64 %and29, 0
  %conv31 = zext i1 %cmp30 to i32
  store i32 %conv31, ptr %s, align 4
  %27 = load i32, ptr %s, align 4
  %28 = load i32, ptr %r, align 4
  %add32 = add nsw i32 %28, %27
  store i32 %add32, ptr %r, align 4
  %29 = load i64, ptr %in.addr, align 8
  %cmp33 = icmp eq i64 %29, 0
  %conv34 = zext i1 %cmp33 to i32
  %30 = load i32, ptr %r, align 4
  %add35 = add nsw i32 %30, %conv34
  store i32 %add35, ptr %r, align 4
  %31 = load i32, ptr %r, align 4
  ret i32 %31
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
