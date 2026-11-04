; ModuleID = '/home/liolsen/galapagos-replication/functions/libgcrypt/variants/c/1_ctz_2.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/libgcrypt/variants/c/1_ctz_2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @ctz(i64 noundef %in) #0 {
entry:
  %retval = alloca i32, align 4
  %in.addr = alloca i64, align 8
  %r = alloca i32, align 4
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
  br i1 %cmp1, label %if.then2, label %if.end3

if.then2:                                         ; preds = %if.end
  %2 = load i32, ptr %r, align 4
  %add = add nsw i32 %2, 32
  store i32 %add, ptr %r, align 4
  %3 = load i64, ptr %in.addr, align 8
  %shr = lshr i64 %3, 32
  store i64 %shr, ptr %in.addr, align 8
  br label %if.end3

if.end3:                                          ; preds = %if.then2, %if.end
  %4 = load i64, ptr %in.addr, align 8
  %and4 = and i64 %4, 65535
  %cmp5 = icmp eq i64 %and4, 0
  br i1 %cmp5, label %if.then6, label %if.end9

if.then6:                                         ; preds = %if.end3
  %5 = load i32, ptr %r, align 4
  %add7 = add nsw i32 %5, 16
  store i32 %add7, ptr %r, align 4
  %6 = load i64, ptr %in.addr, align 8
  %shr8 = lshr i64 %6, 16
  store i64 %shr8, ptr %in.addr, align 8
  br label %if.end9

if.end9:                                          ; preds = %if.then6, %if.end3
  %7 = load i64, ptr %in.addr, align 8
  %and10 = and i64 %7, 255
  %cmp11 = icmp eq i64 %and10, 0
  br i1 %cmp11, label %if.then12, label %if.end15

if.then12:                                        ; preds = %if.end9
  %8 = load i32, ptr %r, align 4
  %add13 = add nsw i32 %8, 8
  store i32 %add13, ptr %r, align 4
  %9 = load i64, ptr %in.addr, align 8
  %shr14 = lshr i64 %9, 8
  store i64 %shr14, ptr %in.addr, align 8
  br label %if.end15

if.end15:                                         ; preds = %if.then12, %if.end9
  %10 = load i64, ptr %in.addr, align 8
  %and16 = and i64 %10, 15
  %cmp17 = icmp eq i64 %and16, 0
  br i1 %cmp17, label %if.then18, label %if.end21

if.then18:                                        ; preds = %if.end15
  %11 = load i32, ptr %r, align 4
  %add19 = add nsw i32 %11, 4
  store i32 %add19, ptr %r, align 4
  %12 = load i64, ptr %in.addr, align 8
  %shr20 = lshr i64 %12, 4
  store i64 %shr20, ptr %in.addr, align 8
  br label %if.end21

if.end21:                                         ; preds = %if.then18, %if.end15
  %13 = load i64, ptr %in.addr, align 8
  %and22 = and i64 %13, 3
  %cmp23 = icmp eq i64 %and22, 0
  br i1 %cmp23, label %if.then24, label %if.end27

if.then24:                                        ; preds = %if.end21
  %14 = load i32, ptr %r, align 4
  %add25 = add nsw i32 %14, 2
  store i32 %add25, ptr %r, align 4
  %15 = load i64, ptr %in.addr, align 8
  %shr26 = lshr i64 %15, 2
  store i64 %shr26, ptr %in.addr, align 8
  br label %if.end27

if.end27:                                         ; preds = %if.then24, %if.end21
  %16 = load i64, ptr %in.addr, align 8
  %and28 = and i64 %16, 1
  %cmp29 = icmp eq i64 %and28, 0
  br i1 %cmp29, label %if.then30, label %if.end32

if.then30:                                        ; preds = %if.end27
  %17 = load i32, ptr %r, align 4
  %add31 = add nsw i32 %17, 1
  store i32 %add31, ptr %r, align 4
  br label %if.end32

if.end32:                                         ; preds = %if.then30, %if.end27
  %18 = load i32, ptr %r, align 4
  store i32 %18, ptr %retval, align 4
  br label %return

return:                                           ; preds = %if.end32, %if.then
  %19 = load i32, ptr %retval, align 4
  ret i32 %19
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
