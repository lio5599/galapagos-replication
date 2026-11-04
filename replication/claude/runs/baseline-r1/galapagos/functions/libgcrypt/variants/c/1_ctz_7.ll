; ModuleID = '/home/liolsen/galapagos-replication/functions/libgcrypt/variants/c/1_ctz_7.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/libgcrypt/variants/c/1_ctz_7.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @ctz(i64 noundef %in) #0 {
entry:
  %retval = alloca i32, align 4
  %in.addr = alloca i64, align 8
  %r = alloca i32, align 4
  %n = alloca i32, align 4
  store i64 %in, ptr %in.addr, align 8
  store i32 0, ptr %r, align 4
  %0 = load i64, ptr %in.addr, align 8
  %cmp = icmp eq i64 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 64, ptr %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %1 = load i64, ptr %in.addr, align 8
  %and = and i64 %1, 4294967295
  %cmp1 = icmp eq i64 %and, 0
  %conv = zext i1 %cmp1 to i32
  %shl = shl i32 %conv, 5
  store i32 %shl, ptr %n, align 4
  %2 = load i32, ptr %n, align 4
  %3 = load i32, ptr %r, align 4
  %add = add nsw i32 %3, %2
  store i32 %add, ptr %r, align 4
  %4 = load i32, ptr %n, align 4
  %5 = load i64, ptr %in.addr, align 8
  %sh_prom = zext i32 %4 to i64
  %shr = lshr i64 %5, %sh_prom
  store i64 %shr, ptr %in.addr, align 8
  %6 = load i64, ptr %in.addr, align 8
  %and2 = and i64 %6, 65535
  %cmp3 = icmp eq i64 %and2, 0
  %conv4 = zext i1 %cmp3 to i32
  %shl5 = shl i32 %conv4, 4
  store i32 %shl5, ptr %n, align 4
  %7 = load i32, ptr %n, align 4
  %8 = load i32, ptr %r, align 4
  %add6 = add nsw i32 %8, %7
  store i32 %add6, ptr %r, align 4
  %9 = load i32, ptr %n, align 4
  %10 = load i64, ptr %in.addr, align 8
  %sh_prom7 = zext i32 %9 to i64
  %shr8 = lshr i64 %10, %sh_prom7
  store i64 %shr8, ptr %in.addr, align 8
  %11 = load i64, ptr %in.addr, align 8
  %and9 = and i64 %11, 255
  %cmp10 = icmp eq i64 %and9, 0
  %conv11 = zext i1 %cmp10 to i32
  %shl12 = shl i32 %conv11, 3
  store i32 %shl12, ptr %n, align 4
  %12 = load i32, ptr %n, align 4
  %13 = load i32, ptr %r, align 4
  %add13 = add nsw i32 %13, %12
  store i32 %add13, ptr %r, align 4
  %14 = load i32, ptr %n, align 4
  %15 = load i64, ptr %in.addr, align 8
  %sh_prom14 = zext i32 %14 to i64
  %shr15 = lshr i64 %15, %sh_prom14
  store i64 %shr15, ptr %in.addr, align 8
  %16 = load i64, ptr %in.addr, align 8
  %and16 = and i64 %16, 15
  %cmp17 = icmp eq i64 %and16, 0
  %conv18 = zext i1 %cmp17 to i32
  %shl19 = shl i32 %conv18, 2
  store i32 %shl19, ptr %n, align 4
  %17 = load i32, ptr %n, align 4
  %18 = load i32, ptr %r, align 4
  %add20 = add nsw i32 %18, %17
  store i32 %add20, ptr %r, align 4
  %19 = load i32, ptr %n, align 4
  %20 = load i64, ptr %in.addr, align 8
  %sh_prom21 = zext i32 %19 to i64
  %shr22 = lshr i64 %20, %sh_prom21
  store i64 %shr22, ptr %in.addr, align 8
  %21 = load i64, ptr %in.addr, align 8
  %and23 = and i64 %21, 3
  %cmp24 = icmp eq i64 %and23, 0
  %conv25 = zext i1 %cmp24 to i32
  %shl26 = shl i32 %conv25, 1
  store i32 %shl26, ptr %n, align 4
  %22 = load i32, ptr %n, align 4
  %23 = load i32, ptr %r, align 4
  %add27 = add nsw i32 %23, %22
  store i32 %add27, ptr %r, align 4
  %24 = load i32, ptr %n, align 4
  %25 = load i64, ptr %in.addr, align 8
  %sh_prom28 = zext i32 %24 to i64
  %shr29 = lshr i64 %25, %sh_prom28
  store i64 %shr29, ptr %in.addr, align 8
  %26 = load i64, ptr %in.addr, align 8
  %and30 = and i64 %26, 1
  %cmp31 = icmp eq i64 %and30, 0
  %conv32 = zext i1 %cmp31 to i32
  store i32 %conv32, ptr %n, align 4
  %27 = load i32, ptr %n, align 4
  %28 = load i32, ptr %r, align 4
  %add33 = add nsw i32 %28, %27
  store i32 %add33, ptr %r, align 4
  %29 = load i32, ptr %r, align 4
  store i32 %29, ptr %retval, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  %30 = load i32, ptr %retval, align 4
  ret i32 %30
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
