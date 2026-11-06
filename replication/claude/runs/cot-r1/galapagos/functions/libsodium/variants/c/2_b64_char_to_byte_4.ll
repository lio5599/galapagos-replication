; ModuleID = '/home/liolsen/galapagos-replication/functions/libsodium/variants/c/2_b64_char_to_byte_4.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/libsodium/variants/c/2_b64_char_to_byte_4.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i32 @b64_char_to_byte(i32 noundef 0)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @b64_char_to_byte(i32 noundef %c) #0 {
entry:
  %retval = alloca i32, align 4
  %c.addr = alloca i32, align 4
  %w = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 %c, ptr %c.addr, align 4
  %0 = load i32, ptr %c.addr, align 4
  %and = and i32 %0, 65535
  store i32 %and, ptr %w, align 4
  %1 = load i32, ptr %w, align 4
  %and1 = and i32 %1, 255
  store i32 %and1, ptr %b, align 4
  %2 = load i32, ptr %w, align 4
  %shr = lshr i32 %2, 8
  switch i32 %shr, label %sw.default [
    i32 0, label %sw.bb
    i32 255, label %sw.bb2
  ]

sw.bb:                                            ; preds = %entry
  br label %sw.epilog

sw.bb2:                                           ; preds = %entry
  %3 = load i32, ptr %b, align 4
  %cmp = icmp eq i32 %3, 47
  %4 = zext i1 %cmp to i64
  %cond = select i1 %cmp, i32 62, i32 63
  store i32 %cond, ptr %retval, align 4
  br label %return

sw.default:                                       ; preds = %entry
  store i32 255, ptr %retval, align 4
  br label %return

sw.epilog:                                        ; preds = %sw.bb
  %5 = load i32, ptr %b, align 4
  switch i32 %5, label %sw.default5 [
    i32 43, label %sw.bb3
    i32 47, label %sw.bb4
  ]

sw.bb3:                                           ; preds = %sw.epilog
  store i32 62, ptr %retval, align 4
  br label %return

sw.bb4:                                           ; preds = %sw.epilog
  store i32 63, ptr %retval, align 4
  br label %return

sw.default5:                                      ; preds = %sw.epilog
  br label %sw.epilog6

sw.epilog6:                                       ; preds = %sw.default5
  %6 = load i32, ptr %b, align 4
  %cmp7 = icmp uge i32 %6, 97
  br i1 %cmp7, label %if.then, label %if.end

if.then:                                          ; preds = %sw.epilog6
  %7 = load i32, ptr %b, align 4
  %cmp8 = icmp ule i32 %7, 122
  br i1 %cmp8, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.then
  %8 = load i32, ptr %b, align 4
  %sub = sub i32 %8, 71
  br label %cond.end

cond.false:                                       ; preds = %if.then
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond9 = phi i32 [ %sub, %cond.true ], [ 255, %cond.false ]
  store i32 %cond9, ptr %retval, align 4
  br label %return

if.end:                                           ; preds = %sw.epilog6
  %9 = load i32, ptr %b, align 4
  %cmp10 = icmp uge i32 %9, 65
  br i1 %cmp10, label %if.then11, label %if.end18

if.then11:                                        ; preds = %if.end
  %10 = load i32, ptr %b, align 4
  %cmp12 = icmp ule i32 %10, 90
  br i1 %cmp12, label %cond.true13, label %cond.false15

cond.true13:                                      ; preds = %if.then11
  %11 = load i32, ptr %b, align 4
  %sub14 = sub i32 %11, 65
  br label %cond.end16

cond.false15:                                     ; preds = %if.then11
  br label %cond.end16

cond.end16:                                       ; preds = %cond.false15, %cond.true13
  %cond17 = phi i32 [ %sub14, %cond.true13 ], [ 255, %cond.false15 ]
  store i32 %cond17, ptr %retval, align 4
  br label %return

if.end18:                                         ; preds = %if.end
  %12 = load i32, ptr %b, align 4
  %cmp19 = icmp uge i32 %12, 48
  br i1 %cmp19, label %if.then20, label %if.end26

if.then20:                                        ; preds = %if.end18
  %13 = load i32, ptr %b, align 4
  %cmp21 = icmp ule i32 %13, 57
  br i1 %cmp21, label %cond.true22, label %cond.false23

cond.true22:                                      ; preds = %if.then20
  %14 = load i32, ptr %b, align 4
  %add = add i32 %14, 4
  br label %cond.end24

cond.false23:                                     ; preds = %if.then20
  br label %cond.end24

cond.end24:                                       ; preds = %cond.false23, %cond.true22
  %cond25 = phi i32 [ %add, %cond.true22 ], [ 255, %cond.false23 ]
  store i32 %cond25, ptr %retval, align 4
  br label %return

if.end26:                                         ; preds = %if.end18
  store i32 255, ptr %retval, align 4
  br label %return

return:                                           ; preds = %if.end26, %cond.end24, %cond.end16, %cond.end, %sw.bb4, %sw.bb3, %sw.default, %sw.bb2
  %15 = load i32, ptr %retval, align 4
  ret i32 %15
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
